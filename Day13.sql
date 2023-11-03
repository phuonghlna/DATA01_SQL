-- Ex01
WITH job_count_cte AS (SELECT 
  company_id, 
  title, 
  description, 
  COUNT(job_id) AS job_count
FROM job_listings
GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count > 1

-- Ex02
WITH ranked_spending_cte AS (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    RANK() OVER (
      PARTITION BY category 
      ORDER BY SUM(spend) DESC) AS ranking 
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
)

SELECT 
  category, 
  product, 
  total_spend 
FROM ranked_spending_cte 
WHERE ranking <= 2 
ORDER BY category, ranking;

-- Ex03
SELECT COUNT(policy_holder_id) AS member_count
FROM (SELECT policy_holder_id,
COUNT(case_id) AS call_count
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) >=3
) AS call_records

-- Ex04
WITH page_like_id AS (
SELECT page_id 
FROM page_likes
WHERE page_id IS NULL
)
SELECT p.page_id
FROM pages p JOIN page_like_id pl
ON p.page_id = pl.page_id

-- Ex05
SELECT
EXTRACT(MONTH FROM curr_month.event_date) AS mth,
COUNT(DISTINCT curr.month_user_id) AS monthly_active_users
FROM user_actions AS curr_month
WHERE EXISTS(
SELECT last_month.user_id
FROM user_actions AS last_month
WHERE last_month.user_id = curr_month.user_id
AND EXTRACT(MONTH FROM last_month.event_date) =
EXTRACT(MONTH FROM curr_month.even_date - interval '1 month')
)
AND EXTRACT(MONTH FROM curr_month,event_date) = 7
AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_month.event_date);

-- Ex06
SELECT DATE_FORMAT(trans_date, '%Y-%m') 
AS month,
       country,
       COUNT(id) AS trans_count,
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(amount) AS trans_total_amount,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;

-- Ex07
# Write your MySQL query statement below
SELECT
p.product_id, 
(SELECT
MIN(year) FROM Sales 
WHERE product_id = p.product_id) AS first_year,
s.quantity,
s.price
FROM
sales s LEFT JOIN product p
ON s.product_id = p.product_id
GROUP BY p.product_id

-- Ex08
SELECT customer_id
FROM customer c
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key)=(
  SELECT COUNT(DISTINCT product_key) 
  FROM product
)

-- Ex09
ELECT employee_id
FROM Employees
WHERE 
     manager_id NOT IN (
         SELECT employee_id
         FROM Employees
     )
    AND
     salary < 30000

-- Ex10
-- Ex này đang trùng với ex1

-- Ex11
# Write your MySQL query statement below
(SELECT u.name AS results
FROM MovieRating mr, Users u
WHERE u.user_id = mr.user_id
GROUP BY mr.user_id
ORDER BY COUNT(mr.user_id) DESC, u.name
LIMIT 1)

UNION ALL

(SELECT m.title AS results
FROM MovieRating mr, Movies m
WHERE mr.movie_id = m.movie_id
AND mr.created_at LIKE '2020-02-%'
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC, m.title
LIMIT 1)

-- Ex12
WITH base AS(SELECT requester_id id FROM RequestAccepted
UNION ALL
SELECT accepter_id id FROM RequestAccepted)

SELECT id, count(*) num  
FROM base
GROUP BY id
ORDER BY COUNT(*) DESC
LIMIT 1
