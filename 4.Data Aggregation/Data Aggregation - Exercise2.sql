# Data Aggregation - Exercise
# 01. Records’ Count
SELECT 
    COUNT(*) as count
FROM
    gringotts.wizzard_deposits;

# 02. Longest Magic Wand
SELECT 
    MAX(magic_wand_size) AS 'longest_magic_wand'
FROM
    gringotts.wizzard_deposits;

# 03. Longest Magic Wand per Deposit Groups
SELECT 
    deposit_group, MAX(magic_wand_size) AS 'longest_magic_wand'
FROM
    gringotts.wizzard_deposits
GROUP BY deposit_group
ORDER BY `longest_magic_wand` , deposit_group ASC;

# 04. Smallest Deposit Group per Magic Wand Size
SELECT 
    deposit_group
 --    AVG(magic_wand_size) AS 'AVG'
FROM
    gringotts.wizzard_deposits
GROUP BY `deposit_group`
ORDER BY AVG(magic_wand_size) ASC
-- ORDER BY `AVG` ASC;
LIMIT 1;

# 05. Deposits Sum
SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    gringotts.wizzard_deposits
GROUP BY deposit_group
ORDER BY `total_sum`ASC;

# 6. Deposits Sum for Ollivander Family
SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    `wizzard_deposits`
WHERE
   `magic_wand_creator` = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group;

# 7. Deposits Filter
SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    gringotts.wizzard_deposits
WHERE
    magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;

# 08. Deposit Charge
SELECT 
    deposit_group,
    magic_wand_creator,
    MIN(deposit_charge) AS 'min_deposit_charge'
FROM
    gringotts.wizzard_deposits
GROUP BY deposit_group,magic_wand_creator
ORDER BY magic_wand_creator , deposit_group;

# 09. Age Groups
SELECT 
    CASE
        WHEN age BETWEEN 0 AND 10 THEN '[0-10]'
        WHEN age BETWEEN 11 AND 20 THEN '[11-20]'
        WHEN age BETWEEN 21 AND 30 THEN '[21-30]'
        WHEN age BETWEEN 31 AND 40 THEN '[31-40]'
        WHEN age BETWEEN 41 AND 50 THEN '[41-50]'
        WHEN age BETWEEN 51 AND 60 THEN '[51-60]'
       --  WHEN age >= 61 THEN '[61+]'
        ELSE '[61+]'
    END AS 'age_group',
    COUNT(age) AS 'wizard_count'
    -- COUNT(*) AS 'wizard_count'
FROM
    gringotts.wizzard_deposits
GROUP BY `age_group`
ORDER BY `wizard_count`;

# 10. First Letter
SELECT
SUBSTRING(`first_name`, 1, 1) AS first_letter
 --  DISTINCT  SUBSTRING(`first_name`, 1, 1) AS first_letter
    -- DISTINCT LEFT(first_name, 1) AS "first_letter"
FROM
    gringotts.wizzard_deposits
WHERE
    deposit_group LIKE 'Troll Chest'
    GROUP BY  `first_letter`
ORDER BY `first_letter` ASC;

# 11. Average Interest
SELECT 
    deposit_group,
    is_deposit_expired,
    AVG(deposit_interest) AS average_interest
FROM
    gringotts.wizzard_deposits
WHERE
    `deposit_start_date` > '1985-01-01'
GROUP BY deposit_group , is_deposit_expired
ORDER BY deposit_group DESC , is_deposit_expired ASC;

# 12. Employees Minimum Salaries
SELECT 
    department_id, MIN(salary) AS 'minimum_salary'
FROM
    soft_uni.employees
WHERE
    department_id IN (2 , 5, 7) AND
         hire_date > '2000-01-01'
GROUP BY department_id
--  HAVING  department_id IN (2 , 5, 7)
ORDER BY department_id ASC;

# 13. Employees Average Salaries
-- 1
CREATE TABLE `salary_more_than_3000` AS
 SELECT * FROM
   `employees`
WHERE
    `salary` > 30000;
-- 2
DELETE FROM soft_uni.salary_more_than_3000 
 WHERE `manager_id` = 42;
 
-- 3
UPDATE soft_uni.salary_more_than_3000 
SET 
    `salary` = `salary` + 5000
WHERE
    `department_id` = 1;
-- 4
SELECT 
department_id,AVG(salary) as ' avg_salary'
FROM
    soft_uni.salary_more_than_3000
    group by department_id
    order by department_id;
    --
    -- 1
CREATE TABLE `salary_more_than_3000` AS
 SELECT * FROM
   `employees`
WHERE
    `salary` > 30000;
-- 2
DELETE FROM `salary_more_than_3000` 
 WHERE `manager_id` = 42;
 
-- 3
UPDATE `salary_more_than_3000`
SET 
    `salary` = `salary` + 5000
WHERE
    `department_id` = 1;
-- 4
SELECT 
department_id,AVG(salary) as 'avg_salary'
FROM
 `salary_more_than_3000`
    group by department_id
    order by department_id;
    
    # 14. Employees Maximum Salaries
SELECT 
    department_id, MAX(salary) AS 'max_salary'
FROM
    soft_uni.employees
GROUP BY department_id
HAVING `max_salary` NOT BETWEEN 30000 AND 70000
ORDER BY department_id;
    
    # 15. Employees Count Salaries
SELECT 
    COUNT(*) AS ''
FROM
    employees
WHERE
    manager_id IS NULL;
  
    # 16. 3rd Highest Salary
SELECT DISTINCT
    department_id, salary
FROM
    employees
ORDER BY department_id , salary DESC
; 

    -- 1
SELECT 
    department_id,
    IF(COUNT(*) >= 3,
        (SELECT DISTINCT salary
            FROM  employees AS e2
            WHERE  e1.department_id = e2.department_id
            ORDER BY salary DESC
            LIMIT 1 OFFSET 2),
        NULL) AS third_highest_salary
FROM   employees AS e1
GROUP BY department_id;

-- 2
SELECT   department_id, MAX(salary) AS third_highest_salary
FROM employees AS e1
WHERE
    (SELECT COUNT(DISTINCT salary)
        FROM employees AS e2
        WHERE  e1.department_id = e2.department_id
                AND e1.salary <= e2.salary) = 3
GROUP BY department_id;

SELECT @@sql_mode;
SET @@sql_mode = SYS.LIST_DROP(@@sql_mode, 'ONLY_FULL_GROUP_BY');
SELECT @@sql_mode;

    # 17. Salary Challenge
SELECT 
    e.first_name, e.last_name, e.department_id
FROM
    employees as  e
WHERE
    e.salary > (SELECT 
            AVG(salary)
        FROM
            employees as e2
        WHERE
            e2.department_id = e.department_id)
ORDER BY e.department_id , e.employee_id
LIMIT 10;
    
    # 18. Departments Total Salaries
SELECT 
    department_id, SUM(salary) AS 'total_salary'
FROM
    employees
GROUP BY department_id
ORDER BY department_id;
    