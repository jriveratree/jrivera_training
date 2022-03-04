with players as (
    select player_id, team_id, season, player_name
    from {{ ref('stg_players')}}
)
select * from players