{{ config(materialized='table', table_name = 'team_performance_insights') }}

WITH team_season_data AS (
    SELECT 
        t.team_name,
        s.season_id,
        s.wins,
        s.draws,
        s.losses,
        s.matches_played,
        s.points
    FROM `datamanagemant2.data_management_2_dataset.team_info` t
    INNER JOIN `datamanagemant2.data_management_2_dataset.season_standings` s ON t.team_name = s.team_name
),

aggregated_data AS (
    SELECT 
        team_name,
        COUNT(season_id) AS seasons_played,
        AVG(points) AS average_points,
        SUM(wins) * 1.0 / SUM(matches_played) AS win_percentage
    FROM team_season_data
    GROUP BY team_name
)

SELECT 
    team_name,
    seasons_played,
    ROUND(average_points, 2) AS average_points,
    ROUND(win_percentage * 100, 2) AS win_percentage
FROM aggregated_data
