-- Ex01
SELECT COUNTRY.continent, FLOOR(AVG(CITY.population))
FROM CITY JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.continent
-- Ex02

-- Ex03
SELECT
age.age_bucket,
ROUND(100.0*(SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'send'))/SUM(activities.time_spent),2) AS send_perc, 
ROUND(100.0*(SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'open'))/SUM(activities.time_spent),2) AS open_perc
FROM activities
INNER JOIN age_breakdown AS age 
  ON activities.user_id = age.user_id 
WHERE activities.activity_type IN ('send', 'open')
GROUP BY age.age_bucket

-- Ex04
