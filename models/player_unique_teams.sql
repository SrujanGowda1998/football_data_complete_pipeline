WITH unique_teams AS (
SELECT DISTINCT
     homeTeam_name
  FROM {{ref ('my_example')}}
 )
SELECT
  DISTINCT
  pos.season_id,
  pos.Player,
  pos.Position,
  pos.Nation,
  pos.PL_Goals as Goals,
  pos.PL_CrdR,
  pos.PL_CrdY ,
  pos.PL_2CrdY,
  pos.PL_fouls,
  ut.homeTeam_name AS team_name
FROM
  datamanagemant2.data_management_2_dataset.players_old_seasons pos
 JOIN
   unique_teams ut
 ON
   pos.Team = ut.homeTeam_name

