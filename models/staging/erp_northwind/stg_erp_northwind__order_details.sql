with 
    source_order_details as (
        select * 
        from {{ source('erp_northwind', 'order_details') }}
    )

,   renamed as (
        select
            cast(order_id as int)
            , cast(product_id as int)
            , cast(unit_price as numeric(10,2))
            , cast(quantity as int)
            , cast(discount as numeric(10,2))
        from source_order_details
    )

select * 
from renamed