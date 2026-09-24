with summary as (
    select
        experiment_group,
        count(*) as users,
        sum(cast(retention_1 as int)) as retained_1_users,
        sum(cast(retention_7 as int)) as retained_7_users,
        avg(cast(retention_1 as int)) as retention_1_rate,
        avg(cast(retention_7 as int)) as retention_7_rate,
        avg(sum_gamerounds) as avg_rounds,
        median(sum_gamerounds) as median_rounds
    from {{ ref('int_cookie_cats') }}
    group by 1
)
select * from summary
order by experiment_group