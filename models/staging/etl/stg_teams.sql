with teams as (
    select 
        league_id	as	league_id	,
		team_id	as	team_id	,
		min_year	as	min_year	,
		max_year	as	max_year	,
		abbreviation	as	abbreviation	,
		nickname	as	nickname	,
		yearfounded	as	yearfounded	,
		city	as	city	,
		arena	as	arena	,
		arenacapacity	as	arenacapacity	,
		"OWNER"	as	owner	,
		generalmanager	as	generalmanager	,
		headcoach	as	headcoach	,
		dleagueaffiliation	as	dleagueaffiliation
    from {{ source('etl', 'stg_teams') }}
)
select * from teams