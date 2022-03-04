with teams as (
    select
        team_id	as	team_id	,
		abbreviation || ' - ' || nickname	as	team_name	,
		yearfounded	as	yearfounded	,
		city	as	city	,
		arena	as	arena	,
		arenacapacity	as	arenacapacity	,
		OWNER	as	owner	,
		generalmanager	as	generalmanager	,
		headcoach	as	headcoach	,
		dleagueaffiliation	as	dleagueaffiliation
    from {{ ref('stg_teams')}}
)
select * from teams