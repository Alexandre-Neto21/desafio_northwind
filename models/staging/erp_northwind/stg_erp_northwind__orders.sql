with 
    source_orders as (
        select * 
        from {{ source('erp_northwind', 'orders') }}
    )

,   renamed as (
        select
            cast(order_id as int)
            , cast(customer_id as string)
            , cast(employee_id as int)
            , cast(order_date as date)
            , cast(required_date as date)
            , cast(shipped_date as date)
            , cast(freight as numeric)
            , cast(ship_city as string)
            , cast(ship_country as string)
        from source_orders
    )

select * 
from renamed