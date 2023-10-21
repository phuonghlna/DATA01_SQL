-- Ex01
SELECT
SUM(CASE
  WHEN device_type = 'laptop' THEN 1
  ELSE 0
END) AS laptop_views,
SUM(CASE
  WHEN device_type LIKE 'tablet' OR device_type LIKE 'phone' THEN 1
  ELSE 0
END) AS laptop_views
FROM viewership

-- Ex02
SELECT x,y,z,
CASE WHEN (x + y > z) AND (x + z > y) AND (y + z > x) THEN 'Yes'
     ELSE 'No'
END as triangle
FROM Triangle

-- Ex03
-- Bài này khi run  code luôn bị báo lỗi division by zero. Team hỗ trợ check lại giúp mình với. Thanks Team!
select 
round(count(case when coalesce(call_category, 'n/a')  in ('', 'n/a') 
then case_id end)::decimal/
count(case_id)::decimal*100,1) as call_percentage
FROM callers

-- Ex04
SELECT name
FROM Customer
WHERE CASE
    WHEN referee_id <> 2 THEN 1
    WHEN referee_id IS NULL THEN 1
    ELSE 0
END = 1;

-- Ex05
select
survived,
SUM(case when pclass = 1 then 1
else 0
end) as first_class,
SUM(case when pclass = 2 then 1
else 0
end) as second_class,
SUM(case when pclass = 3 then 1
else 0
end) as third_class
from titanic
GROUP BY survived
