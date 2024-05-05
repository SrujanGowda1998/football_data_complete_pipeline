{{ config(materialized='table', table_name = 'intermediate_match_outcomes') }}

WITH match_details AS (
    SELECT 
        e.id AS match_id,
        e.utcDate AS match_date,
        e.status,
        e.matchday,
        e.homeTeam_name AS home_team,
        e.awayTeam_name AS away_team,
        e.score_fullTime_home AS fulltime_home_goals,
        e.score_fullTime_away AS fulltime_away_goals,
        e.referees_0_name AS main_referee,
        e.referees_0_nationality AS referee_nationality
    FROM `datamanagemant2.data_management_2_dataset.example_data` e
)

SELECT 
    match_id,
    match_date,
    status,
    matchday,
    home_team,
    away_team,
    fulltime_home_goals,
    fulltime_away_goals,
    main_referee,
    referee_nationality
FROM match_details
