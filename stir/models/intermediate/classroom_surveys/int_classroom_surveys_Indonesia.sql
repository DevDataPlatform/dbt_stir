{{ config(
  materialized='table',
   indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ],
    enabled=true

) }}

select
{{ dbt_utils.star(from= source('source_classroom_surveys', 'indonesia'), except=['district_indonesia', 'c1', 'c2', 'c3', 's1', 's2', 's3', 'e1', 'e2', 'c1a', 'c2', 'c2a', 'c3', 'se1', 'se2', 'se3']) }},
'Indonesia' AS country, location_indonesia AS region, district_indonesia as sub_region, COALESCE(s1, cro1) as s1,
 COALESCE(s2, cro2) as s2,  COALESCE(s3, cro3) as s3, COALESCE(cro4, e1) as e1, COALESCE(cro5, e2) as e2, COALESCE(cro7, c1) as c1,
 COALESCE(cro7a, c1a) as c1a, COALESCE(cro8, c2) as c2, COALESCE(cro8a, c2a) as c2a, COALESCE(cro9, c3) as c3, COALESCE(cro10, se1) as se1,
 COALESCE(cro11, se2) as se2, COALESCE(cro12, se3) as se3
from {{ source('source_classroom_surveys', 'indonesia') }} 
