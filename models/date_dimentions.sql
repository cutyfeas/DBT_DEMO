WITH cte as(
    select 
  TO_TIMESTAMP(replace(STARTTIME,'"',''))  as STARTED_AT  ,
  Date(TO_TIMESTAMP(replace(STARTTIME,'"','')))  as DATE_STARTED_AT ,
  hour(TO_TIMESTAMP(replace(STARTTIME,'"','')))  as HOUR_STARTED_AT , 
  case when dayname(TO_TIMESTAMP(replace(STARTTIME,'"',''))) in ('Sun','Sat') then 'WEEKEND' else 'BUSINESS DAY' end as DAY_TYPE  , 
  'SPRING' as STATION_OF_YEAR
    from {{ source('demo', 'bike') }}
    where replace(STARTTIME,'"','') != 'starttime' 
    limit 10
)
select * from cte  