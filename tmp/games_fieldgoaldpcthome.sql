select 
	sg.game_date_est,
	sg.game_id,
	sg.game_status_text,
	sg.season,
	sg.team_id_home ,
	sg.fieldgoal_pct_home ,
	sum (sgd.fieldgoals_pct)
from {{ ref('stg_games')}} sg 
join {{ ref('stg_games_details')}} sgd on sgd.game_id = sg.game_id and sgd.team_id = sg.team_id_home 
group by sg.game_date_est,
	sg.game_id,
	sg.game_status_text,
	sg.season,
	sg.team_id_home ,
	sg.fieldgoal_pct_home
order by sg.game_id 