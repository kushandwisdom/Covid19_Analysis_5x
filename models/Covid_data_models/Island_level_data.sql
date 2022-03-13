
{{ config(materialized='table') }} 

with Island_level_data as (
select date,
ISLAND,
Avg(POPULATION) as POPULATION,
sum(TOTAL_CASES) as TOTAL_CASES,
sum(TOTAL_ACTIVE_CASES) as TOTAL_ACTIVE_CASES ,
sum(TOTAL_DEATHS) as TOTAL_DEATHS,
sum(NEW_CASES) as NEW_CASES,
sum(NEW_DEATHS) as NEW_DEATHS,
sum(TOTAL_CASES_PER_MILLION) as TOTAL_CASES_PER_MILLION ,
sum(NEW_CASES_PER_MILLION) as NEW_CASES_PER_MILLION,
sum(TOTAL_DEATHS_PER_MILLION) as TOTAL_DEATHS_PER_MILLION
from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_Saurabh_sharma
where LOCATION_LEVEL = 'Province'
group by 1,2

)


select * from Island_level_data

 
