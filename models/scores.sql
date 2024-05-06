
SELECT DISTINCT
    LEAST(homeTeam_name, awayTeam_name) AS team1,
   GREATEST(homeTeam_name, awayTeam_name) AS team2,
   season_id,score_home_team,score_away_team

from datamanagemant2.data_management_2_dataset.old_seasons_scores 
