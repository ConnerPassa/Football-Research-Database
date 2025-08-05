-- This is the script for uploading the data into the database.
-- The first line is a stored procedure i created to do this in one line of code.
-- What each section is essentially doing is deleting all the rows inside each table and then reinserting the data.

-- This allows the data to be consistently updated during the football season or if i make changes to the tables.


EXEC load_data_football;

CREATE OR ALTER PROCEDURE load_data_football AS
BEGIN

	TRUNCATE TABLE all_playcallers;

	BULK INSERT all_playcallers 
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\all_playcallers.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE franchise;

	BULK INSERT franchise
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\franchise.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_blocking;

	BULK INSERT pff_blocking
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_blocking.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_coverage;

	BULK INSERT pff_coverage
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_coverage.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_coverage_scheme;

	BULK INSERT pff_coverage_scheme
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_coverage_scheme.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_defense;

	BULK INSERT pff_defense
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_defense.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_pass_blocking;

	BULK INSERT pff_pass_blocking
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_pass_blocking.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_pass_rush;

	BULK INSERT pff_pass_rush
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_pass_rush.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_pass_rush_productivity;

	BULK INSERT pff_pass_rush_productivity
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_pass_rush_productivity.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_passing;

	BULK INSERT pff_passing
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_passing.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_passing_concepts;

	BULK INSERT pff_passing_concepts
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_passing_concepts.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_receiving;

	BULK INSERT pff_receiving
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_receiving.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_receiving_concepts;

	BULK INSERT pff_receiving_concepts
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_receiving_concepts.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_receiving_depth;

	BULK INSERT pff_receiving_depth
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_receiving_depth.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_run_blocking;

	BULK INSERT pff_run_blocking
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_run_blocking.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_run_defense;

	BULK INSERT pff_run_defense
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_run_defense.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_rushing;

	BULK INSERT pff_rushing
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_rushing.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_slot_coverage;

	BULK INSERT pff_slot_coverage
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_slot_coverage.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE pff_team_grades;

	BULK INSERT pff_team_grades
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\pff_team_grades.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE rosters;

	BULK INSERT rosters
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\rosters.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		CODEPAGE = '65001',
		KEEPNULLS,
		TABLOCK
	);

	TRUNCATE TABLE player_counting_stats;

	BULK INSERT player_counting_stats
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\player_counting_stats.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	TRUNCATE TABLE qb_advanced_stats;

	BULK INSERT qb_advanced_stats
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\qb_advanced_stats.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);


	TRUNCATE TABLE team_efficiency_stats;

	BULK INSERT team_efficiency_stats
	FROM 'C:\Users\conne\Documents\Data Analytics\Football Analytics\Football Research Database\database v2\team_efficiency_stats.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
END