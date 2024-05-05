{{ config(materialized='table', table_name = 'intermediate_tournament_outcomes') }}

WITH tournament_data AS (
    SELECT 
        t.Tournament_Name,
        s.team_name,
        s.position,
        s.points
    FROM `datamanagemant2.data_management_2_dataset.tournaments` t
    INNER JOIN `datamanagemant2.data_management_2_dataset.season_standings` s ON t.Tournament_ID = s.season_id
)

SELECT 
    Tournament_Name,
    team_name,
    position,
    points
FROM tournament_data
