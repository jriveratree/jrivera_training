select 
	sg.game_date_est,
	sg.game_id,
	sg.game_status_text,
	sg.season,
	sg.team_id_home ,
	sg.rebound_away ,
	sum (sgd.rebounds)
from {{ ref('stg_games')}} sg 
join {{ ref('stg_games_details')}} sgd on sgd.game_id = sg.game_id and sgd.team_id = sg.team_id_away 
where sgd.game_id IN (22000070)
group by sg.game_date_est,
	sg.game_id,
	sg.game_status_text,
	sg.season,
	sg.team_id_home ,
	sg.rebound_away
order by sg.game_id 