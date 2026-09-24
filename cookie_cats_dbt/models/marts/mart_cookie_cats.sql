with users as (

    select * from {{ ref('int_cookie_cats') }}

)

select
    experiment_group,
    count(*) as users,
    avg(cast(retention_1 as int)) as retention_1_rate,
    avg(cast(retention_7 as int)) as retention_7_rate,
    avg(sum_gamerounds) as avg_rounds

from users

group by experiment_group