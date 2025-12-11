with 
    source_suppliers as (
        select * 
        from {{ source('erp_northwind', 'suppliers') }}
    )

,   renamed as (
        select
            cast(supplier_id as int)
            , cast(company_name as string) as supplier_name
            , cast(city as string) as supplier_city
            , cast(country as string) as supplier_country
        from source_suppliers
    )

select * 
from renamed