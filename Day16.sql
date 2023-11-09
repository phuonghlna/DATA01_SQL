-- Ex01
select
    ROUND(AVG(case when order_date = customer_pref_delivery_date then 1 else 0 end) * 100, 2) as immediate_percentage
from Delivery 
where (customer_id, order_date) in 
(
    select
        customer_id, 
        min(order_date) as first_order
    from Delivery
    group by customer_id
)

-- Ex02
SELECT 
ROUND(COUNT(distinct a1.player_id)/(SELECT count(distinct player_id) FROM Activity),2) as fraction FROM Activity a1 
JOIN Activity a2
    ON a1.event_date = DATE_ADD(a2.event_date,INTERVAL 1 DAY) AND a1.player_id = a2.player_id
WHERE (a2.player_id,a2.event_date) IN
  (SELECT player_id,min(event_date) FROM Activity 
   GROUP BY player_id)

-- Ex03
SELECT CASE
           WHEN s.id % 2 <> 0 AND s.id = (SELECT COUNT(*) FROM Seat) THEN s.id
           WHEN s.id % 2 = 0 THEN s.id - 1
           ELSE
               s.id + 1
           END AS id,
       student
FROM Seat AS s
ORDER BY id

-- Ex04
  WITH cte AS
(
    SELECT
    visited_on, SUM(amount) amount
FROM
    Customer
GROUP BY
    visited_on
),
cte1 AS
(
SELECT
    visited_on
,   SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 preceding and CURRENT ROW) amount
,   ROUND(AVG(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 preceding and CURRENT ROW),2) average_amount
,   ROW_NUMBER()OVER(ORDER BY visited_on) RN
FROM
    cte
)
SELECT
    visited_on, amount, average_amount
FROM
    cte1
WHERE
    RN > 6
ORDER BY
    visited_on

  -- Ex05
  # Write your MySQL query statement below
SELECT
    ROUND(SUM(insurance.TIV_2016),2) AS TIV_2016
FROM
    insurance
WHERE
    insurance.TIV_2015 IN
    (
      SELECT
        TIV_2015
      FROM
        insurance
      GROUP BY TIV_2015
      HAVING COUNT(*) > 1
    )
    AND CONCAT(LAT, LON) IN
    (
      SELECT
        CONCAT(LAT, LON)
      FROM
        insurance
      GROUP BY LAT , LON
      HAVING COUNT(*) = 1
    )
-- Ex06
select d.name  Department, e.name Employee, Salary 
from Employee e inner join Department d 
on d.id=e.departmentid 
where 4>(
    select count(Distinct salary)
    from  employee e1 
    where e1.salary>=e.salary 
    and e1.departmentid=e.departmentid)

-- Ex07
SELECT Q1.person_name
FROM Queue AS Q1
JOIN QUEUE AS Q2
ON Q1.turn >= Q2.turn
GROUP BY Q1.turn
HAVING SUM(Q2.weight) <= 1000
ORDER BY SUM(Q2.turn) DESC 
LIMIT 1;

-- Ex08
select distinct product_id, 10 as price 
from Products 
where product_id not in(
    select distinct product_id 
    from Products 
    where change_date <='2019-08-16' )
union 
select product_id, new_price as price 
from Products 
where (product_id,change_date) in (
    select product_id , max(change_date) as date 
    from Products 
    where change_date <='2019-08-16' 
    group by product_id)

