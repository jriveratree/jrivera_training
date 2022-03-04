with players as (
    select 
        player_name	as	player_name	,
        team_id	as	team_id	,
        player_id	as	player_id	,
        season	as	season
    from {{ source('etl', 'stg_players') }}
),
ghost_players as (
    select distinct 
        'ghost' player_name,
        gd.team_id,
        gd.player_id,
        1991 season--assupstion for the ghost data
    from {{ source('etl', 'stg_players') }} p
    right join {{ source('etl', 'stg_games_details') }} gd on gd.player_id = p.player_id
    where p.player_id is null
    order by gd.player_id,gd.team_id
)
select * from players
union
select * from ghost_players