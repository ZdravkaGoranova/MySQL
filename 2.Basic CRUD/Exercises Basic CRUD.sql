-- 1
use soft_uni;
SELECT 
    *
FROM
    departments ORDER BY department_id;
    
-- 2

SELECT 
    name
FROM
    departments
ORDER BY department_id;

-- 3
SELECT 
    first_name, last_name, salary
FROM
    employees
ORDER BY employee_id;

-- 4
SELECT 

    first_name, middle_name, last_name
FROM
    employees
ORDER BY employee_id;

-- 5
  SELECT 
    CONCAT(first_name,
            '.',
            last_name,
            '@softuni.bg') as full_email_adress
FROM
    employees;
   
   select *from employees;
  
-- 6
SELECT DISTINCT
    salary
FROM
    employees;
    
SELECT 
    COUNT(DISTINCT salary)
FROM
    employees;
    
-- 7
SELECT 
    *
FROM
    employees
WHERE
    job_title = 'Sales Representative'
    ORDER BY employee_id;
  
-- 8
   SELECT 
    first_name, last_name, job_title
FROM
    employees
WHERE
    salary BETWEEN 20000 AND 30000
ORDER BY employee_id;
     
    