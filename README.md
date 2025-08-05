# Football Research Database

Welcome to the Football Research Database repository!

## Introduction

This database is the first step in a larger obsession to understand the game at its core. It incorporates data from several sources, including the [`nfl_data_py`](https://github.com/nflverse/nfl_data_py) Python package, Pro Football Focus (PFF) premium stats, and OverTheCap.com contract data.

The goal is **intelligence**. Much like SABRmetricians in baseball, I aim to learn about football through the lens of numbers. Is QB X overrated? Is QB Y undervalued? These are the types of questions I'm trying to answer.

## Resources Used

- [`nfl_data_py`](https://github.com/nflverse/nfl_data_py)
- [Pro Football Focus (PFF)](https://www.pff.com/)
- [NFL Next Gen Stats](https://www.nfl.com/stats/next-gen-stats/)
- [OverTheCap](https://overthecap.com/)
- [Pro Football Reference](https://www.pro-football-reference.com/)

## What You'll Find Inside

### 1. Sample Datasets

This repository includes sample datasets from publicly available sources such as `nfl_data_py`. Due to licensing restrictions, I will not share any PFF datasets, as they require a paid subscription.

### 2. Scripts

You'll find both SQL and Python scripts in this repository.

- **SQL Scripts:** Used for creating tables, performing bulk inserts, and cleaning raw uploaded data.
- **Python Scripts:** Focused on calculating advanced statistics such as:
  - Expected Points Added (EPA)
  - Completion Percentage Over Expected (CPOE)
  - Success Rates

### 3. Sample Queries

This section includes various SQL queries used to extract insights about the game. These demonstrate a strong command of SQL, including:

- Subqueries  
- Joins  
- Common Table Expressions (CTEs)  
- Window Functions  
- `CASE WHEN` statements
