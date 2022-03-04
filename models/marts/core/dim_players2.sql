with players as (
    select distinct player_id, player_name
    from {{ ref('stg_players')}}
)
select * from players