{{ config(materialized='table', table_name = 'player_display') }}

WITH example_data AS (
    SELECT 
        t.homeTeam_name,
        s.Player,
        s.Season_id 
    FROM `datamanagemant2.data_management_2_dataset.example_data` t
    LEFT JOIN `datamanagemant2.data_management_2_dataset.player_info_old_seasons` s ON t.homeTeam_name = s.Team
)

SELECT * FROM example_data