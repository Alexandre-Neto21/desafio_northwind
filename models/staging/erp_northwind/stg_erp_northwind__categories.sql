with 
    source_categories as (
        select * 
        from {{ source('erp_northwind', 'categories') }}
    )

,   renamed as (
        select
            cast(category_id as int)
            , cast(category_name as string)
            , cast(description as string)
        from source_categories
    )

select * 
from renamed