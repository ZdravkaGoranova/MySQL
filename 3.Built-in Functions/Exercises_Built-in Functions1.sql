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
    (CHAR_LENGTH(country_name)
    - CHAR_LENGTH(REPLACE(LOWER(country_name), 'a', '')))
    >= 3
ORDER BY iso_code;