-- Ex01
SELECT 
Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3), ID

-- Ex02
SELECT
user_id,
CONCAT(UPPER(LEFT(name,1)), LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id

-- Ex03
SELECT
manufacturer,
CONCAT('$', ROUND(SUM(total_sales)/1000000), ' million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY  SUM(total_sales) DESC, manufacturer

-- Ex04
SELECT
EXTRACT(MONTH FROM submit_date) as mth,
product_id,
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product_id

-- Ex05
