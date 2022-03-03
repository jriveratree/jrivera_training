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
		fgm	as	fieldgoalsmade	,
		fga	as	fieldgoalsattempted	,
		fg_pct	as	fieldgoals_pct	,
		fg3m	as	fieldgoals3made	,
		fg3a	as	fieldgoals3attempted	,
		fg3_pct	as	fieldgoals3_pct	,
		ftm	as	freethrowmade	,
		fta	as	freethrowaattempted	,
		ft_pct	as	freethrow_pct	,
		oreb	as	offensive_rebounds	,
		dreb	as	defensive_rebounds	,
		reb	as	rebounds	,
		ast	as	assists	,
		stl	as	steals	,
		blk	as	blocked_shots	,
		"TO"	as	turnovers	,
		pf	as	personal_fouls	,
		pts	as	points	,
		plus_minus	as	plus_minus
    from {{ source('etl', 'stg_games_details') }}
)
select * from games_details