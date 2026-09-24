with source as (

    select * from {{ ref('cookie_cats') }}

)

select
    userid as user_id,
    version as experiment_group,
    sum_gamerounds,
    retention_1,
    retention_7

from source