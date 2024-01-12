--SELECT *
--FROM employees;

--SELECT 
--	first_name,
--	salary
--FROM employees
--WHERE salary > 30000
--ORDER BY salary DESC;

SELECT * 
FROM suppliers
WHERE coffee_type IN ('Robusta', 'Arabica');

SELECT *
FROM suppliers 
WHERE coffee_type = 'Robusta'
OR coffee_type = 'Arabica';

SELECT * 
FROM suppliers
WHERE coffee_type NOT IN ('Robusta', 'Arabica');

SELECT *
FROM employees 
WHERE email IS NULL;

SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM employees 
ORDER BY salary DESC
	OFFSET 10 ROWS 
	FETCH NEXT 10 ROWS ONLY;

SELECT DISTINCT coffeeshop_id
FROM employees;

--SELECT
--	hire_date,
--	EXTRACT(YEAR FROM hire_date) AS year,
--	EXTRACT(MONTH FROM hire_date) AS month,
--	EXTRACT(DAY FROM hire_date) AS day
--FROM employees;

SELECT
	email,
	COALESCE(email, 'No Email Provided')
FROM employees;

SELECT 
	coffeeshop_id,
	COUNT(employee_id) as noe
FROM employees
GROUP BY coffeeshop_id
ORDER BY noe DESC;

SELECT 
	coffeeshop_id,
	AVG(salary) as avg_salary
FROM employees
GROUP BY coffeeshop_id
ORDER BY avg_salary DESC;

SELECT 
	coffeeshop_id,
	COUNT(*) AS noe,
	ROUND(AVG(salary), 0) AS avg_salary,
	MIN(salary) AS min_salary,
	MAX(salary) AS max_salary,
	SUM(salary) AS total_salary
FROM employees
GROUP BY coffeeshop_id
HAVING COUNT(*) > 200 
ORDER BY noe DESC;


SELECT 
	coffeeshop_id,
	COUNT(*) AS noe,
	ROUND(AVG(salary), 0) AS avg_salary,
	MIN(salary) AS min_salary,
	MAX(salary) AS max_salary,
	SUM(salary) AS total_salary
FROM employees
GROUP BY coffeeshop_id
HAVING MIN(salary) < 10000
ORDER BY noe DESC;

SELECT
	employee_id,
	first_name,
	last_name,
	salary,
	CASE
		WHEN salary < 2000 THEN 'low_pay'
		WHEN salary BETWEEN 20000 AND 50000 THEN 'medium_pay'
		WHEN salary > 50000 THEN 'high_pay'
		ELSE 'no_pay'
	END AS pay_category
FROM employees
ORDER BY salary DESC;

--SELECT 
--	a.pay_category,
--	COUNT(*)
--FROM
--	(SELECT
--		employee_id,
--		first_name,
--		last_name,
--		salary,
--		CASE
--			WHEN salary < 2000 THEN 'low_pay'
--			WHEN salary BETWEEN 20000 AND 50000 THEN 'medium_pay'
--			WHEN salary > 50000 THEN 'high_pay'
--			ELSE 'no_pay'
--		END AS pay_category
--	FROM employees
--	ORDER BY salary DESC
--	) AS  a
--GROUP BY a.pay_category;

SELECT
	SUM(CASE WHEN salary < 20000 THEN 1 ELSE 0 END) AS low_pay,
	SUM(CASE WHEN salary BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END) AS medium_pay,
	SUM(CASE WHEN salary > 50000 THEN 1 ELSE 0 END) AS high_pay
FROM employees; 

SELECT 
	city
FROM locations
UNION
SELECT 
	country
FROM locations;

SELECT * 
FROM shops
WHERE city_id IN ( 
	SELECT city_id
	FROM locations
	WHERE country = 'United States');

SELECT *
FROM employees
WHERE coffeeshop_id IN ( 
	SELECT coffeeshop_id 
	FROM shops
	WHERE city_id IN (
		SELECT city_id
		FROM locations
		WHERE country = 'United States'));

SELECT *
FROM employees
WHERE salary > 35000 AND coffeeshop_id IN ( 
	SELECT coffeeshop_id
	FROM shops
	WHERE city_id IN ( -- US city_id's
		SELECT city_id
		FROM locations
		WHERE country = 'United States'));
