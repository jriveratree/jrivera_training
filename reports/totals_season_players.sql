with players as (
    select player_id, player_name
    from {{ ref('dim_players2') }}
),
report as (
    select 
		gd.season,
        gd.player_id,
        p.player_name,
		avg( gd.points ) points,
		avg( gd.assists ) assists,
		avg( gd.rebounds ) rebounds,
		avg( gd.fieldgoalsmade ) fieldgoalsmade,
		avg( gd.fieldgoals3made ) fieldgoals3made,
		avg( gd.fieldgoals3attempted ) fieldgoals3attempted,
		avg( gd.freethrowmade ) freethrowmade,
		avg( gd.offensive_rebounds ) offensive_rebounds,
		avg( gd.defensive_rebounds ) defensive_rebounds,
		avg( gd.steals ) steals,
		avg( gd.blocked_shots ) blocked_shots,
		avg( gd.turnovers ) turnovers,
		avg( gd.personal_fouls ) fouls
    from  {{ ref('fct_game_details') }} gd
    join players p on p.player_id=gd.player_id
    group by gd.season,
        gd.player_id,
        p.player_name
)
select * from report
order by season desc, player_name