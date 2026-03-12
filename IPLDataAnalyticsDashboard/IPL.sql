CREATE DATABASE ipl_db;

USE ipl_db;

DESCRIBE ipl_data;

SELECT * FROM ipl_data;

-- Total Runs
SELECT SUM(total_runs) AS Total_Runs
FROM ipl_data;

-- Total Matches
SELECT COUNT(DISTINCT `match_id`) AS Total_Matches
FROM ipl_data;

-- Total Wickets
SELECT COUNT(*) AS Total_Wickets
FROM ipl_data
WHERE player_dismissed != 'Not Out';

-- Total Teams
SELECT COUNT(DISTINCT batting_team) AS Total_Teams
FROM ipl_data;

-- Top run Scorers
SELECT batter, SUM(batsman_runs) TotalRuns
FROM ipl_data
GROUP BY batter
ORDER BY TotalRuns DESC
LIMIT 5;

-- Top Wicket Tacker
SELECT bowler, COUNT(player_dismissed) AS TotalWickets
FROM ipl_data
WHERE player_dismissed != 'Not Out'
GROUP BY bowler
ORDER BY TotalWickets DESC
LIMIT 5;

-- Runs by Team
SELECT batting_team, SUM(batsman_runs) As TotalRuns
FROM ipl_data
GROUP BY batting_team
ORDER BY TotalRuns DESC
LIMIT 5;

-- Boundry Analysis
-- Total 4's
SELECT COUNT(total_runs) AS Total_Fours
FROM ipl_data
WHERE total_runs = 4;

-- Total 6's
SELECT COUNT(total_runs) AS Total_Sixes
FROM ipl_data
WHERE total_runs = 6;

-- Total 4's by players
SELECT batter, COUNT(batsman_runs) As TotalBoundaries
FROM ipl_data
WHERE batsman_runs = 4
GROUP BY batter
ORDER BY TotalBoundaries DESC
LIMIT 5;
-- Total 6's by players
SELECT batter, COUNT(batsman_runs) As TotalBoundaries
FROM ipl_data
WHERE batsman_runs = 6
GROUP BY batter
ORDER BY TotalBoundaries DESC
LIMIT 5;

-- Find 4's and 6's togather
SELECT batter,
       SUM(CASE WHEN batsman_runs = 4 THEN 1 ELSE 0 END) AS Fours,
       SUM(CASE WHEN batsman_runs = 6 THEN 1 ELSE 0 END) AS Sixes
FROM ipl_data
GROUP BY batter
ORDER BY Fours DESC
LIMIT 10;

-- Runs by Over
SELECT `over`, SUM(total_runs) As Runs_in_Over
FROM ipl_data
GROUP BY `over`
ORDER BY Runs_in_Over DESC
LIMIT 5;

-- Runs by Team vs Team
SELECT batting_team, bowling_team, 
		COUNT(total_runs) As Total_Runs
FROM ipl_data
GROUP BY batting_team, bowling_team
ORDER BY Total_Runs DESC;

-- Dismissal Type Analysis
SELECT dismissal_kind, 
		COUNT(*) AS Total_Dismissal
FROM ipl_data
WHERE dismissal_kind != 'None'
GROUP BY dismissal_kind;

-- Mention batsman name with dismissal type
SELECT batter, dismissal_kind, 
		COUNT(*) AS Total_Dismissal
FROM ipl_data
WHERE dismissal_kind != 'None'
GROUP BY batter, dismissal_kind;

-- Bowlers with their Extra Deliveries
SELECT bowler, extras_type, 
		COUNT(*) As Extras
FROM ipl_data
WHERE extras_type != 'Good Ball'
GROUP BY bowler, extras_type;











 