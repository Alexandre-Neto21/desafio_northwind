with 
    stg_products as (
        select * 
        from {{ ref('stg_erp_northwind__products') }}
    )

    , stg_suppliers as (
        select *
        from {{ ref('stg_erp_northwind__suppliers') }}
    )

    , stg_categories as (
        select *
        from {{ ref('stg_erp_northwind__categories') }}
    )

    , joined_tables as (
        select 
            stg_products.product_id
            , stg_products.product_name
            , stg_products.unit_price
            , stg_products.units_in_stock
            , stg_products.units_on_order
            , stg_products.reorder_level
            , case 
                when stg_products.discontinued = 1 then 'Sim'
                when stg_products.discontinued = 0 then 'Não'
            end as is_discountinued
            , stg_categories.category_name
            , stg_suppliers.supplier_name
            , stg_suppliers.supplier_country
            , stg_suppliers.supplier_city
        from stg_products
        left join stg_categories on
            stg_products.category_id = stg_categories.category_id
        left join stg_suppliers on
            stg_products.supplier_id = stg_suppliers.supplier_id
    )

select *
from joined_tables

