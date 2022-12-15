-- adding a tag allows me to run certain models togeht, and exclude others. core is everything except the example models
{{ config (
    tags = ['core']
) }}

with 

source as (
    select * from {{ source('staging','scraped_products_p2s')}}
),

staged as (

    select 
        product_productId, 
        product_productName, 
        product_active, 
        product_sku, 
        site_name, 
        urlinfo_siteCountryISOCode as ISO_code, 
        price_currency, 
        price_local, 
        available, 
        product_name, 
        product_master_wid, 
        product_master_name

    from source
    where brand = 'sennheiser'
)

select * from staged
