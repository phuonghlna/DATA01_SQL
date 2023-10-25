-- Ex01
SELECT COUNTRY.continent, FLOOR(AVG(CITY.population))
FROM CITY JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.continent
-- Ex02
SELECT 
  ROUND(COUNT(texts.email_id)::DECIMAL
    /COUNT(DISTINCT emails.email_id),2) AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action = 'Confirmed';

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
WITH supercloud AS(
SELECT c.customer_id,
COUNT(DISTINCT p.product_category) AS unique_count
FROM customer_contracts c LEFT JOIN products p
ON c.product_id = p.product_id
GROUP BY c.customer_id
)

SELECT customer_id
FROM supercloud
WHERE unique_count = (
SELECT COUNT(DISTINCT product_category)
FROM products)
ORDER BY customer_id

-- Ex05
SELECT e1.reports_to AS employee_id,
       e2.name,
       COUNT(e1.reports_to) AS reports_count,
       ROUND(avg(e1.age),0) AS average_age
FROM employees e1
JOIN employees e2
ON e1.reports_to=e2.employee_id
GROUP BY e1.reports_to
ORDER BY e1.reports_to

-- Ex06
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p JOIN Orders o
ON p.product_id = o.product_id
WHERE EXTRACT( MONTH FROM o.order_date) = 2 
GROUP BY p.product_name
HAVING SUM(o.unit) >=100

-- Ex07
SELECT pages.page_id
FROM pages
LEFT OUTER JOIN page_likes AS likes
  ON pages.page_id = likes.page_id
WHERE likes.page_id IS NULL;

