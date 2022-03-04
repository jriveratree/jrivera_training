with games as (
    select distinct --cleaning duplicates
        game_date_est	as	game_date_est,
		game_id	as	game_id,
		game_status_text	as	game_status_text,
		season	as	season,
		team_id_home	as	team_id_home,
		team_id_away	as	team_id_away,
		home_team_wins	as	home_team_wins,
		--BEGING this columns is no longer needed, but still load to show some tests
		--decide to trust on game_details data
		pts_home	as	points_home,
		fg_pct_home	as	fieldgoal_pct_home,
		ft_pct_home	as	freethrow_pct_home,
		fg3_pct_home	as	fieldgoal3_pct_home,
		ast_home	as	assists_home,
		reb_home	as	rebound_home,
		pts_away	as	points_away,
		fg_pct_away	as	fieldgoal_pct_away,
		ft_pct_away	as	freethrow_pct_away,
		fg3_pct_away	as	fieldgoal3_pct_away,
		ast_away	as	assists_away,
		reb_away	as	rebound_away
		--END this columns is no longer needed, but still load to show some tests
		--home_team_id	as	home_team_id,--redundant
		--visitor_team_id	as	visitor_team_id,--redundant
    from {{ source('etl', 'stg_games') }}
	where not(( game_id = 22000070 and reb_away = 44 ) or ( game_id = 22000076 and round(fg_pct_home*1000)/1000 = 0.453 )) --only get one row for special duplicated records
)
select * from games