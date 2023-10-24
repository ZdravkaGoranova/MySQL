-- 1. Find Names of All Employees by First Name
use soft_uni;

SELECT 
    first_name, last_name
FROM
    employees
WHERE
   lower( first_name LIKE 'sa%')
   
ORDER BY employee_id;
    
-- 2. Find Names of All Employees by Last Name
SELECT 
    first_name, last_name
FROM
    employees
WHERE
   lower( last_name )LIKE '%ei%'
ORDER BY employee_id;

-- 3. Find First Names of All Employees
SELECT 
    first_name
FROM
    employees
WHERE
department_id in (3,10)
--      department_id = 3 OR department_id = 10
    and year( hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id ASC;
        
 -- 4. Find All Employees Except Engineers   
SELECT 
    first_name, last_name
FROM
    employees
WHERE
lower(job_title) not  LIKE  '%engineer%'
ORDER BY employee_id ASC;

 -- 5. Find Towns with Name Length
SELECT 
    `name`
FROM
    towns
WHERE
    LENGTH(name) = 5 OR LENGTH(`name`) = 6
ORDER BY name ASC;
 
 -- 6. Find Towns Starting With
SELECT 
    *
FROM
    towns
WHERE
-- upper(left(name,1)) in ('M','K','B','E')
-- name regexp '^[mkbe]'
    LOWER(`name`) LIKE 'm%'
        OR LOWER(`name`) LIKE 'k%'
        OR LOWER(`name`) LIKE 'b%'
	OR LOWER(`name`) LIKE 'e%'
ORDER BY name ASC;

-- 7. Find Towns Not Starting With
SELECT 
    *
FROM
    towns
WHERE

name regexp '^[^RrBbDd]'
	-- 	upper(name) NOT LIKE 'R%'
--         OR upper(name) NOT  LIKE 'B%'
--         OR upper(name) NOT  LIKE 'D%'
ORDER BY name ASC;

-- 8. Create View Employees Hired After 2000 Year

CREATE
    VIEW v_employees_hired_after_2000 as
SELECT 
   first_name,last_name
FROM
    employees 
    where year(hire_date) >2000;
    
    select *from v_employees_hired_after_2000;
    
  --  9. Length of Last Name
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    CHAR_LENGTH(last_name) = 5;
    
    -- 10. Countries Holding 'A'
    use geography;
 
SELECT 
    country_name, iso_code
FROM
    countries
WHERE
-- lower( country_name) LIKE '%a%a%a'
 (CHAR_LENGTH(country_name)
   - CHAR_LENGTH(REPLACE(LOWER(country_name), 'a', '')))
    >= 3
ORDER BY iso_code;

-- 11. Mix of Peak and River Names
SELECT 
    p.peak_name,
    r.river_name,
    LOWER(CONCAT(LEFT(p.peak_name,length(p.peak_name)-1), r.river_name)) AS mix
FROM
    rivers AS r,
    peaks AS p
WHERE
    UPPER(RIGHT(p.peak_name, 1)) = UPPER(LEFT(r.river_name, 1))
    ORDER BY MIX;
    
    -- 12. Games from 2011 and 2012 Year
    
SELECT 
    `name`, DATE_FORMAT(start, '%Y-%m-%d') as start
FROM
    `games`
    WHERE year(start) in (2011,2012)
ORDER BY start , name
LIMIT 50;

    -- 13. User Email Providers

SELECT 
    user_name,
SUBSTRING_INDEX(email, '@', - 1)AS `email provider`,
REGEXP_REPLACE(email,'.*@','')AS `REGEXP`
FROM
    users
    ORDER BY `email provider`ASC, user_name;

-- 14. Get Users with IP Address Like Pattern
SELECT 
   user_name,ip_address
FROM
    users
    WHERE ip_address LIKE '___.1%.%.___'
    ORDER BY user_name ASC;
    
    -- 15. Show All Games with Duration
    
 SELECT 
    name AS game,
    CASE
        WHEN HOUR(start) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN HOUR(start) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS 'Part of the Day',
    CASE
        WHEN duration <= 3 THEN 'Extra Short'
        WHEN duration BETWEEN 3 AND 6 THEN 'Short'
        WHEN duration BETWEEN 6 AND 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM
    games;
    
    -- 16. Orders Table
SELECT 
    product_name,
    order_date,
    DATE_ADD(order_date, INTERVAL 3 DAY) AS 'pay_due',
    DATE_ADD(order_date, INTERVAL 1 MONTH) AS 'deliver_due'
FROM
    orders;
    