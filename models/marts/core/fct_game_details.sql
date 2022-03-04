with fct_games_details as (
    select 
        gd.game_id	,
		gd.team_id	,
		gd.player_id,
		season,
		points,--1
		fieldgoals_pct,--2
		freethrow_pct,--3
		fieldgoals3_pct,--4
		assists,--5
		rebounds,--6
		fieldgoalsmade,
		fieldgoalsattempted,
		fieldgoals3made,
		fieldgoals3attempted,
		freethrowmade,
		freethrowaattempted,
		offensive_rebounds,
		defensive_rebounds,
		steals,
		blocked_shots,
		turnovers,
		personal_fouls,
		plus_minus
    from {{ ref('stg_games_details') }} gd
	inner join {{ ref('stg_games') }} g on g.game_id = gd.game_id
)
select * from fct_games_details