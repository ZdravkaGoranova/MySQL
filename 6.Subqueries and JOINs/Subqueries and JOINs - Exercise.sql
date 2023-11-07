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
    employee_id,
    first_name,
 --    ROUND(salary, 2),
	salary,
    d.name AS 'department_name'
FROM
    employees AS e
        JOIN
    departments AS d ON d.department_id = e.department_id
WHERE
    e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;
    
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
  --   ep.employee_id IS NULL
  ep.project_id is null
ORDER BY employee_id DESC
LIMIT 3;
    
#06. Employees Hired After
SELECT 
    first_name, last_name, hire_date, d.name as 'dept_name'
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
    DATE(p.start_date) > '2002-08-13'
        AND p.end_date IS NULL
ORDER BY e.first_name ASC , `project_name` ASC
LIMIT 5;

#08. Employee 24
# 75 / 100
SELECT e.employee_id, e.first_name, 
CASE WHEN p.start_date > '2005-01-01' THEN NULL ELSE p.name END AS 'project_name'
-- if(YEAR(p.start_date)>=2005 ,null ,p.name ) AS 'project_name'
FROM employees AS e
 JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
 JOIN projects AS p ON ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY project_name ASC;

#09. Employee Manager

SELECT 
    e.employee_id,
    e.first_name,
    e.manager_id,
    m.first_name AS manager_name
FROM
    employees AS e
        JOIN
    employees AS m ON e.manager_id = m.employee_id
WHERE
    e.manager_id IN (3 , 7)
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

SELECT MIN(average_salary) AS min_average_salary
FROM (
    SELECT department_id, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
) AS department_avg_salaries;

#12. Highest Peaks in Bulgaria

SELECT 
    mc.country_code, m.mountain_range, p.peak_name, p.elevation
FROM
    peaks AS p
        JOIN
    mountains AS m ON m.id = p.mountain_id
        JOIN
    mountains_countries AS mc ON mc.mountain_id = m.id
        JOIN
    countries AS c ON c.country_code = mc.country_code
WHERE
    p.elevation > 2835
        AND c.country_name = 'Bulgaria'
ORDER BY p.elevation DESC;
  
#13. Count Mountain Ranges
SELECT 
    c.country_code, COUNT(mountain_range) AS mountain_range_count
FROM
    countries AS c
        JOIN
    mountains_countries AS mc ON mc.country_code = c.country_code
        JOIN
    mountains AS m ON m.id = mc.mountain_id
WHERE
    c.country_name IN ('United States' , 'Russia', 'Bulgaria')
GROUP BY c.country_code
order by mountain_range_count DESC;

#--2
SELECT 
    c.country_code, COUNT(mountain_range) AS mountain_range_count
FROM
    countries AS c
        JOIN
    mountains_countries AS mc ON mc.country_code = c.country_code
        JOIN
    mountains AS m ON m.id = mc.mountain_id
WHERE
    c.country_code IN ('US', 'RU', 'BG')
GROUP BY c.country_code
order by mountain_range_count DESC;

#14. Countries with Rivers

SELECT 
    c.country_name, r.river_name
FROM
    countries AS c
LEFT  JOIN
    countries_rivers AS cr ON c.country_code = cr.country_code
LEFT JOIN
    rivers AS r ON r.id = cr.river_id
 JOIN continents as con on con.continent_code=c.continent_code
    where continent_name = 'Africa'
ORDER BY c.country_name ASC
LIMIT 5;



-- SELECT c.country_name, r.river_name
-- FROM countries AS c
-- JOIN countries_rivers AS cr ON c.country_code = cr.country_code
-- JOIN rivers AS r ON r.id = cr.river_id
-- JOIN continents AS cc ON cc.continent_code = c.continent_code
-- WHERE cc.continent_name NOT LIKE 'Africa'
-- ORDER BY c.country_name
-- LIMIT 5;

#15. *Continents and Currencies

#16. Countries without any Mountains

SELECT COUNT(*) AS country_count
FROM countries
WHERE country_code NOT IN (SELECT DISTINCT country_code FROM mountains_countries);

#17. Highest Peak and Longest River by Country

SELECT country_name
FROM countries

limit 5;

