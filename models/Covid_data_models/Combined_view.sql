{{ config(materialized='view') }}


 with combined_data as (

select 
'Country' as flag,
Date,
Null as LOCATION,
Null as LOCATION_ISO_CODE,
 POPULATION,
 TOTAL_CASES,
 TOTAL_ACTIVE_CASES ,
 TOTAL_DEATHS,
 NEW_CASES,
 NEW_DEATHS,
 TOTAL_CASES_PER_MILLION ,
 NEW_CASES_PER_MILLION,
 TOTAL_DEATHS_PER_MILLION

 from {{ ref('Country_level_data') }}


 union all 

 select 
'Province' as flag,
Date,
 LOCATION,
 LOCATION_ISO_CODE,
 POPULATION,
 TOTAL_CASES,
 TOTAL_ACTIVE_CASES ,
 TOTAL_DEATHS,
 NEW_CASES,
 NEW_DEATHS,
 TOTAL_CASES_PER_MILLION ,
 NEW_CASES_PER_MILLION,
 TOTAL_DEATHS_PER_MILLION

 from {{ ref('Province_level_data') }}

  union all 

 select 
'Island' as flag,
Date,
 ISLAND,
 LOCATION_ISO_CODE,
 POPULATION,
 TOTAL_CASES,
 TOTAL_ACTIVE_CASES ,
 TOTAL_DEATHS,
 NEW_CASES,
 NEW_DEATHS,
 TOTAL_CASES_PER_MILLION ,
 NEW_CASES_PER_MILLION,
 TOTAL_DEATHS_PER_MILLION

 from {{ ref('Island_level_data') }}
 )

 select * from combined_data