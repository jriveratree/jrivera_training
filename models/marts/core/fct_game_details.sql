with fct_games_details as (
    select 
        game_id	,
		team_id	,
		player_id,
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
)
select * from fct_games_details