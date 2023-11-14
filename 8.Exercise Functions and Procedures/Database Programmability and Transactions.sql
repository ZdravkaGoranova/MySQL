# Exercises: Database Programmability and Transactions
# 01. Employees with Salary Above 35000

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
SELECT 
e.first_name,e.last_name
FROM employees as e 
WHERE e.salary > 35000
ORDER BY e.first_name,e.last_name,e.employee_id asc;
END $$
DELIMITER ;
;
CALL usp_get_employees_salary_above_35000();

# 02. Employees with Salary Above Number

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(IN number_salary decimal(19,4))
BEGIN
SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
WHERE
    e.salary >= `number_salary`
ORDER BY e.first_name , e.last_name , e.employee_id ASC;
END $$
DELIMITER ;
;
CALL usp_get_employees_salary_above(4500);

#  03. Town Names Starting With
DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(IN prefix VARCHAR(50))
BEGIN
SELECT 
    name as 'town_name'
FROM
    towns
WHERE
        name LIKE CONCAT(`prefix`, '%')
    order by `town_name` ASC;
END $$
DELIMITER ;
;
CALL usp_get_towns_starting_with('c');

# 04. Employees from Town
DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town(IN prefix VARCHAR(50))
BEGIN
SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
        JOIN
    addresses AS a ON e.address_id = a.address_id
        JOIN
    towns AS t ON t.town_id = a.town_id
WHERE
    t.name = prefix
ORDER BY e.first_name , e.last_name , e.employee_id ASC;
END $$
DELIMITER ;
;
CALL usp_get_employees_from_town('Sofia');

# 05. Salary Level Function
DELIMITER $$
 CREATE FUNCTION ufn_get_salary_level( `empl_salary` DECIMAL (19,4))
 RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE salary_level VARCHAR(20);
SET salary_level = CASE 
 WHEN `empl_salary` < 30000 THEN 'Low'
        WHEN `empl_salary` BETWEEN 30000 AND 50000 THEN 'Average'
        ELSE 'High'
         END;
		
--           IF salary < 30000 THEN
--         SET salary_level = 'Low';
--     ELSEIF salary BETWEEN 30000 AND 50000 THEN
--         SET salary_level = 'Average';
--     ELSE
--         SET salary_level = 'High';
--     END IF;

RETURN salary_level;
END $$
DELIMITER ;
;
SELECT  ufn_get_salary_level(125500.00) AS salary_Level;

# 06. Employees by Salary Level
DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level( IN salary_level VARCHAR(20))
BEGIN
SELECT 
 first_name,last_name
FROM
    employees
WHERE
        ufn_get_salary_level(salary) = salary_level
    ORDER BY
        first_name DESC,
        last_name DESC;
END  $$
DELIMITER ;
;
CALL usp_get_employees_by_salary_level('High');

#  07. Define Function
DELIMITER $$
CREATE FUNCTION ufn_is_word_comprised(
    set_of_letters VARCHAR(50),
    word VARCHAR(50)
) RETURNS INT
DETERMINISTIC

BEGIN
    DECLARE set_len INT;
    DECLARE word_len INT;
    DECLARE i INT;

    SET set_len = LENGTH(set_of_letters);
    SET word_len = LENGTH(word);
    SET i = 1;

    WHILE i <= set_len DO
        IF LOCATE(SUBSTRING(set_of_letters, i, 1), word) = 0 THEN
            RETURN 0; 
        END IF;
        SET i = i + 1;
    END WHILE;
    RETURN 1; 
END $$
DELIMITER ;
;
SELECT UFN_IS_WORD_COMPRISED('oistmiahf', 'Sofia') AS result;

# 08. Find Full Name


#  9. People with Balance Higher Than
# 10. Future Value Function
# 11. Calculating Interest
# 12. Deposit Money
# 13. Withdraw Money
# 14. Money Transfer
#  15. Log Accounts Trigger
# 16. Emails Trigger
# 