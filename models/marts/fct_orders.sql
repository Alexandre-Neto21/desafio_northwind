with 
    int_orders as (
        select *
        from {{ ref('int_orders') }}
    )

    , fct_orders as (
        select
            int_orders.orders_sk as orders_sk
            , int_orders.employee_id as employee_fk
            , int_orders.customer_id as customer_fk
            , int_orders.order_date as order_date
            , int_orders.required_date as required_date 
            , int_orders.shipped_date as shipped_date
            , int_orders.product_id as product_fk
            , int_orders.order_id as order_id
            , int_orders.ship_country as ship_country
            , int_orders.ship_city as ship_city
            , int_orders.unit_price as unit_price
            , int_orders.quantity as quantity
            , int_orders.discount as discount
            , case
                when int_orders.discount > 0 then 'sim'
                else 'não'
            end as has_discount
            , int_orders.unit_price * int_orders.quantity as gross_total
            , int_orders.unit_price * (1-int_orders.discount) * int_orders.quantity as net_total
            , int_orders.freight * (int_orders.unit_price * (1-int_orders.discount) * int_orders.quantity) 
             / sum(int_orders.unit_price * (1-int_orders.discount) * int_orders.quantity) over (partition by int_orders.order_id) as freight_allocated
        from int_orders        
    )

select *
from fct_orders
