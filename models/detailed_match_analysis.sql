WITH match_referee_performance AS (
    SELECT 
        m.match_id,
        m.match_date,
        m.home_team,
        m.away_team,
        m.fulltime_home_goals,
        m.fulltime_away_goals,
        m.main_referee,
        m.referee_nationality,
        CASE WHEN m.fulltime_home_goals > m.fulltime_away_goals THEN 'Home Win'
             WHEN m.fulltime_home_goals < m.fulltime_away_goals THEN 'Away Win'
             ELSE 'Draw' END AS match_outcome
    FROM {{ ref('intermediate_match_outcomes4') }} m
),

referee_stats AS (
    SELECT 
        main_referee,
        referee_nationality,
        COUNT(match_id) AS total_matches,
        COUNT(CASE WHEN match_outcome = 'Home Win' THEN 1 END) AS home_wins,
        COUNT(CASE WHEN match_outcome = 'Away Win' THEN 1 END) AS away_wins,
        COUNT(CASE WHEN match_outcome = 'Draw' THEN 1 END) AS draws
    FROM match_referee_performance
    WHERE main_referee IS NOT NULL AND referee_nationality IS NOT NULL
    GROUP BY main_referee, referee_nationality
)

