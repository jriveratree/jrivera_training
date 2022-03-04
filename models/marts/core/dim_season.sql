with seasons as (
    select distinct season
    from {{ ref('stg_games')}}
)
select * from seasons