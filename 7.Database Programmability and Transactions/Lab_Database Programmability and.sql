# Lab: Database Programmability and Transactions

# 1. Count Employees by Town
SELECT 
    COUNT(*) AS 'count'
FROM
    employees AS e
        JOIN
    addresses AS a ON a.address_id = e.address_id
        JOIN
    towns AS t ON t.town_id = a.town_id
WHERE
    t.name = 'Redmond'
GROUP BY t.town_id;
    
DELIMITER $$
CREATE FUNCTION  ufn_count_employees_by_town(town_name VARCHAR(50))
RETURNS int
DETERMINISTIC
BEGIN
-- DECLARE e_count INT;
RETURN(
-- set e_count:=(SELECT )
-- return e_count;
SELECT 
    COUNT(*) AS 'count'
FROM
    employees AS e
        JOIN
    addresses AS a ON a.address_id = e.address_id
        JOIN
    towns AS t ON t.town_id = a.town_id
WHERE
    t.`name` = `town_name`
GROUP BY t.town_id
) ;
END $$
DELIMITER ;

SELECT UFN_COUNT_EMPLOYEES_BY_TOWN('Sofia') AS count ;
SELECT name,UFN_COUNT_EMPLOYEES_BY_TOWN(name) AS count  from towns;

# 2. Employees Promotion

DELIMITER $$
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(50))
BEGIN 

UPDATE employees AS e 
JOIN departments AS d 
ON e.department_id = d.department_id 
SET salary = salary * 1.05

WHERE d.name = department_name;

END$$
DELIMITER ;
;
-- SET @answer=0;
-- CALL usp_raise_salaries('Finance',@answer);
CALL usp_raise_salaries('Finance');

SELECT 
   e.first_name, e.salary
FROM
    employees as e
    where department_id=10
    ORDER BY e.first_name, e.salary;

# 3. Employees Promotion by ID

# 4. Triggered
