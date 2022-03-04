with games_details as (
    select 
        game_id	as	game_id	,
		team_id	as	team_id	,
		team_abbreviation	as	team_abbreviation	,
		team_city	as	team_city	,
		player_id	as	player_id	,
		player_name	as	player_name	,
		nickname	as	nickname	,
		start_position	as	start_position	,
		"COMMENT"	as	comment	,
		"min"	as	mins_played	,
		coalesce( fgm, 0) as fieldgoalsmade,
		coalesce( fga, 0) as fieldgoalsattempted,
		coalesce( fg_pct, 0) as fieldgoals_pct,--2
		coalesce( fg3m, 0) as fieldgoals3made,
		coalesce( fg3a, 0) as fieldgoals3attempted,
		coalesce( fg3_pct, 0) as fieldgoals3_pct,--4
		coalesce( ftm, 0) as freethrowmade,
		coalesce( fta, 0) as freethrowaattempted,
		coalesce( ft_pct, 0) as freethrow_pct,--3
		coalesce( oreb, 0) as offensive_rebounds,
		coalesce( dreb, 0) as defensive_rebounds,
		coalesce( reb, 0) as rebounds,--6
		coalesce( ast, 0) as assists,--5
		coalesce( stl, 0) as steals,
		coalesce( blk, 0) as blocked_shots,
		coalesce( "TO", 0) as turnovers,
		coalesce( pf, 0) as personal_fouls,
		coalesce( pts, 0) as points,--1
		coalesce( plus_minus, 0) as plus_minus
    from {{ source('etl', 'stg_games_details') }} gd
)
select * from games_details