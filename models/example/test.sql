/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (
    -- Fetch data from example_data table
    select * from datamanagemant2.data_management_2_dataset.example_data
    -- union all
    -- Fetch data from fifa_rankings table
    -- select * from datamanagemant2.data_management_2_dataset.fifa_rankings
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
