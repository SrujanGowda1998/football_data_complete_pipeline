{{ config(materialized='table', table_name = 'previous_season_scores') }}
WITH example_teams AS (
SELECT DISTINCT
 LEAST(homeTeam_shortName, awayTeam_shortName) AS team1,
GREATEST(homeTeam_shortName, awayTeam_shortName) AS team2,
 from datamanagemant2.data_management_2_dataset.example_data
)

SELECT
  oss.season_id,
  oss.score_home_team,
  oss.score_away_team,
  oss.homeTeam_name,
  oss.awayTeam_name
FROM
  example_teams et
JOIN
  datamanagemant2.data_management_2_dataset.old_seasons_scores oss
ON
  et.team1 = oss.homeTeam_name AND
  et.team2 = oss.awayTeam_name
