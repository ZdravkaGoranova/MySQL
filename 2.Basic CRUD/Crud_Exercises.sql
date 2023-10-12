SELECT * FROM employees;
SELECT id, first_name, last_name, job_title FROM employees;
SELECT id, first_name, last_name, job_title 
FROM employees
ORDER BY first_name;

SELECT e.id, e.first_name, e.last_name, e.job_title 
FROM employees
AS e ORDER BY job_title;

SELECT 
id AS 'ID', 
first_name AS 'First Name',
 last_name AS 'Last Name',
 job_title AS'Job Title'
FROM employees
ORDER BY id;

SELECT 
    id AS 'ID',
    CONCAT(first_name, ' ', last_name) AS 'Full Name',
    job_title AS 'Job Title'
FROM
    employees
ORDER BY id;
SELECT 
    id AS 'ID',
    CONCAT(first_name, ' ', last_name) AS 'Full Name',
    job_title AS 'Job Title'
FROM
    employees
ORDER BY id;

SELECT 
    id AS 'ID',
    CONCAT_WS('-',first_name, last_name) AS 'Full Name',
    job_title AS 'Job Title'
FROM
    employees
ORDER BY id;

SELECT 
    id AS 'ID',
    CONCAT_WS(' ',first_name, last_name) AS 'Full Name',
    job_title ,
    salary
FROM
    employees
WHERE salary > 1000;

SELECT  distinct last_name FROM employees;

SELECT id, first_name, last_name, job_title, salary ,department_id
FROM employees
where NOT (department_id =1 AND first_name='John');

SELECT id, first_name, last_name, job_title, salary ,department_id
FROM employees
where  department_id =1 AND salary >2000;

SELECT id, first_name, last_name, job_title, department_id
FROM employees
WHERE id BETWEEN 1 AND 4;

SELECT id, first_name, last_name, job_title, department_id
FROM employees
WHERE department_id  IN(1,54,3,6,98);

SELECT id, first_name, last_name, job_title, department_id
FROM employees
WHERE department_id NOT  IN(1,54,3,6,98);

SELECT 
    *
FROM
    employees
WHERE
    salary >= 1000 AND department_id = 4
ORDER BY id;


SELECT 
    *
FROM
    employees
WHERE
    salary IS NOT NULL;
    
    SELECT 
    *
FROM
    employees
WHERE
    salary IS NULL;
    
    
     SELECT 
    *
FROM
    employees
ORDER BY department_id DESC, salary DESC;

CREATE view v_top_paid_employee AS 
SELECT   *
FROM employees
ORDER BY salary DESC;
SELECT * FROM v_top_paid_employee LIMIT 1;
SELECT  first_name, salary
FROM v_top_paid_employee LIMIT 0 , 1;

INSERT INTO employees VALUES(11,'Fist','Last','Job',2,9999);
INSERT INTO employees (first_name,last_name, job_title,department_id,salary) 
VALUES ('Mimi','','COOK',2,399);

SELECT   *
FROM employees;

SELECT   *
FROM employees WHERE department_id=1;

DELETE FROM employees 
WHERE department_id = 1;

TRUNCATE TABLE rooms;

UPDATE employees
SET  salary=salary +100
WHERE department_id=2;

SELECT   *
FROM employees;

DELETE FROM employees
WHERE department_id = 1
OR department_id = 2;
SELECT * FROM employees


