with source as (

    select * from {{ ref('stg_cookie_cats') }}

)

select
    user_id,
    experiment_group,
    sum_gamerounds,
    retention_1::boolean as retention_1,
    retention_7::boolean as retention_7

from source