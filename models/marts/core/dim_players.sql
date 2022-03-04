with players as (
    select team_id, player_id, season, player_name
    from {{ ref('stg_players')}}
)
select * from players