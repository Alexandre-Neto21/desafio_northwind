with 
    source_employees as (
        select * 
        from {{ source('erp_northwind', 'employees') }}
    )

,   renamed as (
        select
            cast(employee_id as int)
            , cast(first_name as string) || ' ' || cast(last_name as string) as employee_name
            , cast(title as string) as employee_position
            , cast(city as string) as employee_city
            , cast(country as string) as employee_country
        from source_employees
    )

select * 
from renamed