{{ config(materialized='table', table_name='comprehensive_team_performance_analysis') }}

WITH comprehensive_performance AS (
    SELECT
        t.team_name,
        t.seasons_played,
        t.average_points,
        t.win_percentage,
        i.season_id,
        i.total_wins,
        i.total_draws,
        i.total_losses,
        i.total_matches,
        i.total_points
    FROM {{ ref('team_performance_insights') }} t
    JOIN {{ ref('intermediate_team_performance1') }} i ON t.team_name = i.team_name
)

SELECT
    c.team_name,
    c.seasons_played,
    c.average_points,
    c.win_percentage,
    c.season_id,
    c.total_wins,
    c.total_draws,
    c.total_losses,
    c.total_matches,
    c.total_points
FROM comprehensive_performance c
