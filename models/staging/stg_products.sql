-- adding a tag allows me to run certain models togeht, and exclude others. core is everything except the example models
{{ config (
    tags = ['core']
) }}

with 

source as (
    select * from {{ source('dimensional','dim_product_master')}}
),

staged as (

    select 
        row_wid, 
        J_ITEM_DESC, 
        J_IMPRP0_DESC 

    from source
)

select * from staged