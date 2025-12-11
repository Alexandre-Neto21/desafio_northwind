with 
    source_order_details as (
        select * 
        from {{ source('erp_northwind', 'order_details') }}
    )

,   renamed as (
        select
            cast(order_id as int)
            , cast(product_id as int)
            , cast(unit_price as numeric)
            , cast(quantity as int)
            , cast(discount as numeric)
        from source_order_details
    )

select * 
from renamed