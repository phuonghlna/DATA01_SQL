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
SELECT
sender_id, COUNT(message_id) AS count_mesages
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) ='8'
AND EXTRACT(YEAR FROM sent_date) = '2022' 
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2

-- Ex06
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15

-- Ex07
ECT activity_date AS day,
COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-27' -30 AND '2019-07-27'
GROUP BY activity_date

-- Ex08

-- Ex09
select position('a' IN first_name)
from worker
WHERE first_name ='Amitah'

-- Ex10
select title,
substring(title,length(winery) +2, 4) as vintage_year
from winemag_p2;
