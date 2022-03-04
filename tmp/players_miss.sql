with child as (
    select player_id as from_field
    from "dbt_training02"."dbt_jriveratree"."stg_games_details"
    where player_id is not null
),

parent as (
    select player_id as to_field
    from "dbt_training02"."dbt_jriveratree"."stg_players"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null