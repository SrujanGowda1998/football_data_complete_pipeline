{{ config(materialized='table') }}
with source_data as (
    select * from datamanagemant2.data_management_2_dataset.team_info
)
select *
from source_data