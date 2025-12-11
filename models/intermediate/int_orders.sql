with 
    stg_orders as (
        select * 
        from {{ ref('stg_erp_northwind__orders') }}
    )

    , stg_order_details as (
        select *
        from {{ ref('stg_erp_northwind__order_details') }}
    )

    , joined_tables as (
        select 
            stg_orders.order_id
            , stg_orders.employee_id
            , stg_orders.customer_id
            , stg_orders.order_date
            , stg_orders.required_date
            , stg_orders.shipped_date
            , stg_orders.freight
            , stg_orders.ship_city
            , stg_orders.ship_country
            , stg_order_details.unit_price
            , stg_order_details.quantity
            , stg_order_details.discount
            , stg_order_details.product_id
        from stg_order_details
        left join stg_orders on
            stg_order_details.order_id = stg_orders.order_id
    )

    , create_sk as(
        select
            cast(order_id as string) || '-' || cast(product_id as string) as orders_sk
            , *
        from joined_tables
    )

select *
from create_sk

