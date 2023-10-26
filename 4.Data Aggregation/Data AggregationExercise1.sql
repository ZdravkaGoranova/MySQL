SELECT 
    department_id, SUM(salary) as 'Total Salaries'
FROM
    restaurant.employees
GROUP BY department_id;

--
SELECT 
    COUNT(*)
FROM
    employees;
    
  --  
    SELECT 
   department_id, COUNT(*)
FROM
    employees
    GROUP BY department_id;
    
    --
    -- 1. Departments Info
  SELECT 
    department_id, COUNT(*)as 'Number of employees'
FROM
    employees
    GROUP BY department_id
    order by department_id;
    
    -- 2. Average Salary
SELECT 
    department_id, 
    ROUND(AVG(salary),2) AS 'Average Salary'
FROM
    employees
GROUP BY department_id
ORDER BY department_id; 

-- 3. Minimum Salary
SELECT department_id, ROUND(MIN(salary), 2) AS "Min Salary"
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 800;

SELECT department_id, ROUND(MIN(salary), 2) AS "Min Salary"
FROM employees
GROUP BY department_id
HAVING `Min Salary` > 800;

-- 4. Appetizers Count
SELECT 
  count(*)
FROM
    products
WHERE
    category_id = 2 AND price > 8;

-- 5. Menu Prices
SELECT 
    category_id,
    ROUND(AVG(price), 2) AS 'Average Price',
    ROUND(MIN(PRICE), 2) AS 'Cheapest Product',
    ROUND(MAX(PRICE), 2) AS 'Most Expensive Product'
FROM
    restaurant.products
GROUP BY category_id;