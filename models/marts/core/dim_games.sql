--i can use crosstab or nest here, but i want to keep simple thing for this time
with home as (
    select
        game_date_est	as	game_date_est,
		game_id	as	game_id,
		game_status_text	as	game_status_text,
		season	as	season,
		home_team_wins	as	home_team_wins,
		team_id_home	as	team_id,
		1 as is_home
    from {{ ref('stg_games')}}
),
away as (
    select
        game_date_est	as	game_date_est,
		game_id	as	game_id,
		game_status_text	as	game_status_text,
		season	as	season,
		home_team_wins	as	home_team_wins,
		team_id_away	as	team_id,
		0 as is_home
    from {{ ref('stg_games')}}
)
select * from home
union
select * from away
order by game_id, team_id