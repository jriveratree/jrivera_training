select 
	sg.game_date_est,
	sg.game_id,
	sg.game_status_text,
	sg.season,
	sg.team_id_home ,
	sg.points_home ,
	sum (sgd.points)
from {{ ref('stg_games')}} sg 
join {{ ref('stg_games_details')}} sgd on sgd.game_id = sg.game_id and sgd.team_id = sg.team_id_home 
--where sgd.game_id IN (20300399) AND sgd.team_id IN (1610612760)
group by sg.game_date_est,
	sg.game_id,
	sg.game_status_text,
	sg.season,
	sg.team_id_home ,
	sg.points_home
having sg.points_home-sum (sgd.points)<>0
order by sg.game_id 