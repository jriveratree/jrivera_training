with report as (
    select 
		gd.season,
		gd.team_id,
		t.team_name,
		avg( gd.points ) points,--1
		avg( gd.fieldgoalsmade ) fieldgoalsmade,
		avg( gd.fieldgoals3made ) fieldgoals3made,
		avg( gd.freethrowmade ) freethrowmade
    from  {{ ref('fct_game_details') }} gd
	join {{ ref('dim_teams') }} t on t.team_id=gd.team_id
	group by  gd.season,
		gd.team_id,
		t.team_name
)
select * from report
order by season desc
