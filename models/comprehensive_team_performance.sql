{{ config(materialized='table', table_name='comprehensive_team_performance') }}

WITH team_details AS (
    SELECT
        ti.team_name,
        ti.country_name,
        ti.manager_name,
        ti.stadium_name,
    FROM `datamanagemant2.data_management_2_dataset.team_info` ti
),

player_stats AS (
    SELECT
        tp.team_name,
        COUNT(tp.player_name) AS number_of_players,
        -- Round the average market value to two decimal places
        ROUND(AVG(tp.proposed_market_value), 2) AS average_market_value
    FROM `datamanagemant2.data_management_2_dataset.team_players_info` tp
    GROUP BY tp.team_name
),

team_performance AS (
    SELECT
        ss.team_name,
        ss.season_id,
        ss.wins,
        ss.draws,
        ss.losses,
        ss.points,
        ss.position
    FROM `datamanagemant2.data_management_2_dataset.season_standings` ss
)

SELECT
    td.team_name,
    td.country_name,
    td.manager_name,
    td.stadium_name,
    ps.number_of_players,
    ps.average_market_value,
    tp.season_id,
    tp.wins,
    tp.draws,
    tp.losses,
    tp.points,
    tp.position
FROM team_details td
JOIN player_stats ps ON td.team_name = ps.team_name
JOIN team_performance tp ON td.team_name = tp.team_name
