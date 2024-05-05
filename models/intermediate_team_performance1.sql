{{ config(materialized='table', table_name = 'intermediate_team_performance') }}

WITH aggregated_team_data AS (
    SELECT 
        ti.Team_Name AS team_name,
        ss.season_id,
        SUM(ss.wins) AS total_wins,
        SUM(ss.draws) AS total_draws,
        SUM(ss.losses) AS total_losses,
        SUM(ss.matches_played) AS total_matches,
        SUM(ss.points) AS total_points
    FROM `datamanagemant2.data_management_2_dataset.team_info` ti
    INNER JOIN `datamanagemant2.data_management_2_dataset.season_standings` ss ON ti.Team_Name = ss.team_name
    GROUP BY ti.Team_Name, ss.season_id
)

SELECT 
    team_name,
    season_id,
    total_wins,
    total_draws,
    total_losses,
    total_matches,
    total_points
FROM aggregated_team_data
