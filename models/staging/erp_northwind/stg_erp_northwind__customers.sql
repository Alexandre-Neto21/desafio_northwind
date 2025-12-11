with 
    source_customers as (
        select * 
        from {{ source('erp_northwind', 'customers') }}
    )

,   renamed as (
        select
            cast(customer_id as string)
            , cast(company_name as string) as customer_name
            , cast(city as string) as customer_city
            , cast(country as string) as customer_country
        from source_customers
    )

select * 
from renamed