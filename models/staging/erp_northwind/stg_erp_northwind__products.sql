with 
    source_products as (
        select * 
        from {{ source('erp_northwind', 'products') }}
    )

,   renamed as (
        select
            cast(product_id as int)
            , cast(product_name as string)
            , cast(supplier_id as int)
            , cast(category_id as int)
            , cast(unit_price as numeric)
            , cast(units_in_stock as int)
            , cast(units_on_order as int)
            , cast(reorder_level as int)
            , cast(discontinued as int)
        from source_products
    )

select * 
from renamed