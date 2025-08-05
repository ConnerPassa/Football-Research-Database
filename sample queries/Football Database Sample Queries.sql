USE [Football Research];

-- Football Research Database SQL Sample Queries

------------------------------------------------------------------------------------------------------------------------------------------------

-- Exercise #1 

-- Percentiles: Show what percentiles NFL QB's are in each season for 6 key metrics.

-- Those metrics are:
-- 1) EPA per dropback
-- 2) PFF passing grades 
-- 3) CPOE
-- 4) Pressure to Sack Rate
-- 5) Big Time Throw Rate
-- 6) Turnover Worthy Play Rate

-- Will be used for building radar charts on the QB Power BI dashboard.

-- SQL concepts used include: CTE's, Window Functions, Joins, Aliasing

WITH qb_percentiles AS (
	SELECT 
		p.player_name,
		p.player_id,
		p.season,
		r.team_id,
		p.dropbacks,
		ROUND(q.epa_per_dropback, 3) AS epa_per_dropback,
		p.grades_pass,
		ROUND(q.cpoe, 3) AS cpoe,
		p.pressure_to_sack_rate,
		p.btt_rate,
		p.twp_rate,
		PERCENT_RANK() OVER (PARTITION BY q.season ORDER BY q.epa_per_dropback) AS pct_epa_per_dropback,
        PERCENT_RANK() OVER (PARTITION BY q.season ORDER BY p.grades_pass) AS pct_grades_pass,
        PERCENT_RANK() OVER (PARTITION BY q.season ORDER BY q.cpoe) AS pct_cpoe,
        PERCENT_RANK() OVER (PARTITION BY q.season ORDER BY p.pressure_to_sack_rate) AS pct_pressure_to_sack_rate,
        PERCENT_RANK() OVER (PARTITION BY q.season ORDER BY p.btt_rate) AS pct_btt_rate,
        PERCENT_RANK() OVER (PARTITION BY q.season ORDER BY p.twp_rate) AS pct_twp_rate
	 FROM pff_passing p
	 JOIN rosters r
		ON p.player_id = r.player_id AND p.season = r.season
	JOIN qb_advanced_stats q
		ON p.player_id = q.player_id AND p.season = q.season
	WHERE p.dropbacks > 300
)
SELECT 
	season,
    player_name,
    player_id,
    team_id,
    dropbacks,
    epa_per_dropback,
    (ROUND(pct_epa_per_dropback, 2) * 100) AS pct_epa_per_dropback,
	grades_pass,
    (ROUND(pct_grades_pass, 2) * 100) AS pct_grades_pass,
    cpoe,
    (ROUND(pct_cpoe, 2) * 100) AS pct_cpoe,
    pressure_to_sack_rate,
    (ROUND(pct_pressure_to_sack_rate, 2) * 100) AS pct_pressure_to_sack_rate,
    btt_rate,
    (ROUND(pct_btt_rate, 2) * 100) AS pct_btt_rate,
    twp_rate,
    (ROUND(pct_twp_rate, 2) * 100) AS pct_twp_rate
FROM qb_percentiles
ORDER BY season DESC, epa_per_dropback DESC; 


------------------------------------------------------------------------------------------------------------------------------------------------

-- Excersie #2

-- Which quarterback's in each season had a higher EPA per dropback than leage average (300 min dropbacks)?

-- SQL concepts: subquerries, aliasing, joins

SELECT
q.season,
q.player_name,
q.player_id,
r.team_id,
q.dropbacks,
ROUND(q.epa_per_dropback, 3) AS epa_per_dropback,

(SELECT ROUND(AVG(l.epa_per_dropback), 3)
FROM qb_advanced_stats l
WHERE l.dropbacks > 300
	AND l.season = q.season) AS league_avg_epa,

ROUND(epa_per_dropback - (
	SELECT AVG(l.epa_per_dropback)
    FROM qb_advanced_stats l
    WHERE l.dropbacks > 300 
		AND l.season = q.season) ,3) AS epa_above_avg

FROM qb_advanced_stats q
JOIN rosters r
	ON q.player_id = r.player_id AND q.season = r.season
WHERE dropbacks > 300 
	AND q.epa_per_dropback > (
		SELECT AVG(l.epa_per_dropback)
        FROM qb_advanced_stats l
        WHERE l.season = q.season
			AND l.dropbacks > 300)
ORDER BY season DESC, epa_above_avg DESC;


------------------------------------------------------------------------------------------------------------------------------------------------

-- Exercise #3

-- Playing off the previous query, how many QB's per season are playing above league average?

WITH above_avg_qbs AS (
	SELECT
		q.season,
		q.player_id,
		q.player_name,
		q.epa_per_dropback
	FROM qb_advanced_stats q
	WHERE q.dropbacks > 300
		AND q.epa_per_dropback > (
			SELECT AVG(l.epa_per_dropback)
			FROM qb_advanced_stats l
			WHERE l.season = q.season AND l.dropbacks > 300
		)
)

SELECT
	season,
	COUNT(*) as number_qbs_above_average
FROM above_avg_qbs
GROUP BY season
ORDER BY season DESC;

------------------------------------------------------------------------------------------------------------------------------------------------

-- Exercise #4

-- Use a CASE WHEN statements to classify PFF pass rushing grades. Filter out non-defensive lineman. 
-- Then show the difference in grades from all pass plays vs. true pass sets

-- Definition: True Pass Sets are plays that take away gimmicks like screens, play action, designed rollouts, and RPO's.
--             They are meant to weed out noise from trickery and isolate a defensive lineman's performance in traditional pass sets.

-- SQL Concepts: CTE, CASE WHEN, JOINS, FILTERING, ORDER BY

WITH graded_rushers AS (
	SELECT 
		p.season,
		p.player_name,
		p.player_id,
		r.team_id,
		p.position,
		p.snap_counts_pass_rush,
		p.sacks,
		p.total_pressures,
		p.grades_pass_rush_defense,
		
		CASE
			WHEN p.grades_pass_rush_defense >= 90 THEN 'Elite'
			WHEN p.grades_pass_rush_defense >= 80 THEN 'Very Good'
			WHEN p.grades_pass_rush_defense >= 70 THEN 'Above Average'
			WHEN p.grades_pass_rush_defense >= 60 THEN 'Average'
			ELSE 'Below Average'
		END AS pass_rush_tier,

		p.true_pass_set_grades_pass_rush_defense,

		CASE
			WHEN p.true_pass_set_grades_pass_rush_defense >= 90 THEN 'Elite'
			WHEN p.true_pass_set_grades_pass_rush_defense >= 80 THEN 'Very Good'
			WHEN p.true_pass_set_grades_pass_rush_defense >= 70 THEN 'Above Average'
			WHEN p.true_pass_set_grades_pass_rush_defense >= 60 THEN 'Average'
			ELSE 'Below Average'
		END AS true_pass_set_pass_rush_tier,

		Round(p.grades_pass_rush_defense - p.true_pass_set_grades_pass_rush_defense, 2) AS pass_rush_difference
		
	FROM pff_pass_rush p
	JOIN rosters r
		ON r.player_id = p.player_id and p.season = r.season
	WHERE p.snap_counts_pass_play> 100
)

SELECT *
FROM graded_rushers
WHERE (position = 'ED' or position = 'DI')
ORDER BY season DESC, pass_rush_difference DESC;
