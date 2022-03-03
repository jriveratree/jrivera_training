with players as (
    select 
        player_name	as	player_name	,
        team_id	as	team_id	,
        player_id	as	player_id	,
        season	as	season
    from {{ source('etl', 'stg_players') }}
)
select * from players