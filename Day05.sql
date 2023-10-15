-- Ex01
SELECT DISTINCT CITY
FROM STATION
WHERE (ID % 2) = 0

-- Ex02
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION

-- Ex03
SELECT CEIL(AVG(salary) - AVG(REPLACE(salary, 0, ''))) 
FROM employees

-- Ex04
SELECT
ROUND(CAST(SUM(item_count*order_occurrences)/SUM(order_occurrences)AS DECIMAL),1) AS mean
FROM items_per_order

-- Ex05
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3

-- Ex06
SELECT
user_id,
DATE(MAX(post_date))-DATE(MIN(post_date)) AS days_between
FROM posts
WHERE post_date >= '2021-01-01' AND post_date < '2022-01-01'
GROUP BY user_id
HAVING COUNT (post_id) >=2

-- Ex07
SELECT
card_name,
MAX(issued_amount) - MIN(issued_amount) AS Gap
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY Gap DESC

-- Ex08
SELECT
manufacturer,
COUNT(drug) AS drug_count,
ABS(SUM(cogs-total_sales)) AS total_lost
FROM pharmacy_sales
WHERE total_sales < cogs
GROUP BY manufacturer
ORDER BY total_lost DESC

-- Ex09
SELECT
id, movie, description, rating 
FROM Cinema
WHERE id % 2 = 1 AND description <> 'Boring'
ORDER BY rating DESC

-- Ex10
SELECT
teacher_id,
COUNT(DISTINCT subject_id) AS Cnt 
FROM Teacher
GROUP BY teacher_id

-- Ex11
SELECT user_id, 
COUNT(follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id

-- Ex12
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5


