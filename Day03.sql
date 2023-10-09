-- ex 1
SELECT NAME FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA'

-- ex 2
SELECT * FROM CITY
WHERE COUNTRYCODE ='JPN'

-- ex 3
SELECT CITY, STATE FROM STATION

-- ex 4
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%'

-- ex 5
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u'

-- ex 6
SELECT DISTINCT CITY FROM STATION
WHERE CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%'

-- ex 7
SELECT name FROM Employee
ORDER BY name

-- ex 8
SELECT name FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id 

-- ex 9
SELECT product_id FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'

-- ex 10
SELECT name FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL

-- ex 11
SELECT name, population, area FROM World
WHERE area > 3000000 OR population >= 25000000

-- ex 12
SELECT author_id as id FROM Views
WHERE author_id = viewer_id
GROUP BY id
ORDER BY id




