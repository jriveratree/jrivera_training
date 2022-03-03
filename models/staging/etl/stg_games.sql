with games as (
    select 
        game_date_est	as	game_date_est,
		game_id	as	game_id,
		game_status_text	as	game_status_text,
		home_team_id	as	home_team_id,
		visitor_team_id	as	visitor_team_id,
		season	as	season,
		team_id_home	as	team_id_home,
		pts_home	as	points_home,
		fg_pct_home	as	fieldgoal_pct_home,
		ft_pct_home	as	freethrow_pct_home,
		fg3_pct_home	as	fieldgoal3_pct_home,
		ast_home	as	assists_home,
		reb_home	as	rebound_home,
		team_id_away	as	team_id_away,
		pts_away	as	points_away,
		fg_pct_away	as	fieldgoal_pct_away,
		ft_pct_away	as	freethrow_pct_away,
		fg3_pct_away	as	fieldgoal3_pct_away,
		ast_away	as	assists_away,
		reb_away	as	rebound_away,
		home_team_wins	as	home_team_wins
    from {{ source('etl', 'stg_games') }}
)
select * from games