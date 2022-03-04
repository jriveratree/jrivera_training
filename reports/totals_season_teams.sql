with fct_games_details as (
    select 
--        fgd.game_id	,
		fgd.team_id	,
		g.season,
		sum( points ) points,--1
		avg( fieldgoals_pct ) fieldgoals_pct,--2
		avg( freethrow_pct ) freethrow_pct,--3
		avg( fieldgoals3_pct ) fieldgoals3_pct,--4
		sum( assists ) assists,--5
		sum( rebounds ) rebounds,--6
		sum( fieldgoalsmade ) fieldgoalsmade,
		sum( fieldgoalsattempted ) fieldgoalsattempted,
		sum( fieldgoals3made ) fieldgoals3made,
		sum( fieldgoals3attempted ) fieldgoals3attempted,
		sum( freethrowmade ) freethrowmade,
		sum( freethrowaattempted ) freethrowaattempted,
		sum( offensive_rebounds ) offensive_rebounds,
		sum( defensive_rebounds ) defensive_rebounds,
		sum( steals ) steals,
		sum( blocked_shots ) blocked_shots,
		sum( turnovers ) turnovers,
		sum( personal_fouls ) fouls,
		sum( plus_minus ) plus_minus
    from  {{ ref('stg_games_details') }} fgd 
    join (
    	select g.game_id, g.season 
    	from {{ ref('dim_games') }} g
    	group by g.game_id, g.season
    ) g on g.game_id = fgd.game_id 
    
	group by  g.season, fgd.team_id
    order by g.season, points
)
select * from fct_games_details