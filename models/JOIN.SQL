WITH CTE AS(
SELECT * FROM {{ ref('DAILY_WEATHER') }} A 
LEFT JOIN {{ ref('date_dimentions') }} B
ON A.DAILY_WEATHER=B.DATE_STARTED_AT

)
SELECT * FROM CTE

--
--