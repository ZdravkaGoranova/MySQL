# Subqueries and JOINs - Exercise

#01. Employee Address
SELECT 
    employee_id, job_title, a.address_id, a.address_text
FROM
    employees AS e
        JOIN
    addresses AS a ON a.address_id = e.address_id
ORDER BY a.address_id ASC
LIMIT 5;

#02. Addresses with Towns
SELECT 
    first_name, last_name, name AS 'town', address_text
FROM
    employees AS e
        JOIN
    addresses AS a ON e.address_id = a.address_id
        JOIN
    towns AS t ON a.town_id = t.town_id
        AND a.town_id = t.town_id
ORDER BY first_name ASC , last_name
LIMIT 5;

#03. Sales Employee
SELECT 
    employee_id, first_name, last_name, d.name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    d.name = 'Sales'
ORDER BY employee_id DESC;

#04. Employee Departments
SELECT 
    employee_id, first_name, salary, d.name AS 'department_name'
FROM
    employees AS e
        JOIN
    departments AS d ON d.department_id = e.department_id
WHERE
    e.salary > 15000
   --  GROUP BY   e.salary
--     HAVING  e.salary>15000
    order by d.department_id desc
    limit 5;
    
#05. Employees Without Project
# -- 1
SELECT employee_id, first_name
FROM employees
WHERE employee_id NOT IN (
    SELECT DISTINCT employee_id
    FROM employees_projects
)
ORDER BY employee_id DESC
LIMIT 3;

# -- 2
SELECT 
    employees.employee_id, first_name
FROM
    employees
        LEFT JOIN
    employees_projects AS ep ON ep.employee_id = employees.employee_id
WHERE
    ep.employee_id IS NULL
ORDER BY employee_id DESC
LIMIT 3;
    
#06. Employees Hired After
SELECT 
    first_name, last_name, hire_date, d.name
FROM
    employees AS e
        JOIN
    departments AS d ON d.department_id = e.department_id
WHERE
    d.name IN ('Sales' , 'Finance')
 --    AND (dept_name = 'Sales' OR dept_name = 'Finance')
        AND hire_date > '1999-1-1'
ORDER BY hire_date ASC;

#07. Employees with Project

SELECT 
    e.employee_id, e.first_name, p.name AS 'project_name'
FROM
    employees AS e
        JOIN
    employees_projects AS ep ON ep.employee_id = e.employee_id
        JOIN
    projects AS p ON p.project_id = ep.project_id
WHERE
    p.start_date > '2002-08-13'
        AND p.end_date IS NULL
ORDER BY e.first_name ASC , `project_name` ASC
LIMIT 5;

#08. Employee 24
# 75 / 100
SELECT e.employee_id, e.first_name, 
       CASE WHEN p.start_date > '2005-01-01' THEN NULL ELSE p.name END AS 'project_name'
FROM employees AS e
LEFT JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
LEFT JOIN projects AS p ON ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY project_name ASC;

#09. Employee Manager
SELECT e.employee_id, e.first_name, e.manager_id, m.first_name AS manager_name
FROM employees AS e
JOIN employees AS m ON e.manager_id = m.employee_id
WHERE m.manager_id IN (3, 7)
ORDER BY e.first_name ASC;

#10. Employee Summary
SELECT 
    e.employee_id,
    CONCAT_WS(' ', e.first_name, e.last_name) AS 'employee_name',
    CONCAT_WS(' ', m.first_name, m.last_name) AS 'manager_name',
    d.name AS ' department_name'
FROM employees AS e
JOIN employees AS m ON e.manager_id = m.employee_id
JOIN departments AS d ON e.department_id = d.department_id
WHERE e.manager_id IS NOT NULL
ORDER BY e.employee_id
LIMIT 5;



#11. Min Average Salary

#12. Highest Peaks in Bulgaria

#13. Count Mountain Ranges

#14. Countries with Rivers

#15. *Continents and Currencies

#16. Countries without any Mountains

#17. Highest Peak and Longest River by Country



