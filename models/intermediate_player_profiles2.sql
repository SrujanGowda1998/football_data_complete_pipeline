{{ config(materialized='table', table_name = 'intermediate_player_profiles') }}

WITH player_data AS (
    SELECT 
        p.Player_Name,
        p.Team_Name,
        p.Position,
        p.Height,
        COALESCE(p.Preferred_Foot, 'n/a') AS Preferred_Foot,
        p.Country,
        t.Sport,
        t.Category_Name
    FROM `datamanagemant2.data_management_2_dataset.team_players_info` p
    INNER JOIN `datamanagemant2.data_management_2_dataset.team_info` t ON p.Team_Name = t.Team_Name
)

SELECT 
    Player_Name,
    Team_Name,
    Position,
    Height,
    Preferred_Foot,
    Country,
    Sport,
    Category_Name
FROM player_data
