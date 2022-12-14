-- adding a tag allows me to run certain models togeht, and exclude others. core is everything except the example models
{{ config (
    tags = ['core']
) }}

with p2s as (
    select * from {{ ref('stg_p2s') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

p2s_products as (
    select 
        product_productId, 
        product_productName, 
        product_active, 
        product_sku, 
        site_name, 
        ISO_code, 
        price_currency, 
        price_local, 
        available, 
        product_name, 
        product_master_wid, 
        product_master_name
    
    from p2s as s

    inner join products as p
    
    on s.product_master_wid = p.row_wid
)

select * from p2s_products