-- Cau-1
SELECT DISTINCT replacement_cost FROM film
ORDER BY replacement_cost
LIMIT 1

--Cau-2
SELECT
SUM(CASE WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1 ELSE 0
END) AS Low
/*SUM(CASE WHEN replacement_cost BETWEEN 20 AND 24.99 THEN 1 ELSE 0
END) AS Medium,
SUM(CASE WHEN replacement_cost BETWEEN 25 AND 29.99 THEN 1 ELSE 0
END) AS High*/
FROM film

--Cau-3
SELECT f.title, f.length, c.name
FROM film f JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c 
ON fc.category_id = c.category_id
WHERE c.name = 'Drama' OR c.name = 'Sports'
ORDER BY f.length DESC
LIMIT 1

--Cau-4
SELECT COUNT(f.title) AS title_qty, c.name
FROM film f JOIN film_category fc
ON f.film_id = fc.film_id
JOIN category c 
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY title_qty DESC
LIMIT 1

--Cau-5
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_qty
FROM actor a JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY film_qty DESC
LIMIT 1

--Cau-6
SELECT a.address
FROM address a LEFT JOIN customer c
ON a.address_id = c.address_id
WHERE c.customer_id IS NULL

--Cau-7
SELECT c.city, SUM(p.amount) as revenue FROM city c JOIN address a
ON c.city_id = a.city_id
JOIN customer cst 
ON cst.address_id = a.address_id
JOIN payment p 
ON p.customer_id = cst.customer_id
GROUP BY c.city
ORDER BY revenue DESC
LIMIT 1

--Cau-8
-- Dap an: United States, Tallahassee : 50.85 hình như là nơi có doanh thu thấp nhất, team check lại giúp mình nhé!
SELECT 
c.city || ', ' || ct.country AS City_Country,
SUM(p.amount) as revenue 
FROM city c JOIN country ct
ON c.country_id = ct.country_id
JOIN address a
ON c.city_id = a.city_id
JOIN customer cst 
ON cst.address_id = a.address_id
JOIN payment p 
ON p.customer_id = cst.customer_id
GROUP BY c.city, ct.country
ORDER BY revenue
LIMIT 1

