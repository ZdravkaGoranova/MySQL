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
# 04. Employees from Town
# 05. Salary Level Function
# 06. Employees by Salary Level
#  07. Define Function
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