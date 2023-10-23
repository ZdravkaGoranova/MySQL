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