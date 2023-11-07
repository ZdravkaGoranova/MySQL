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

#04. Employee Departments

#05. Employees Without Project

#06. Employees Hired After

#07. Employees with Project

#08. Employee 24

#09. Employee Manager

#09. Employee Manager

#10. Employee Summary

#11. Min Average Salary

#12. Highest Peaks in Bulgaria

#13. Count Mountain Ranges

#14. Countries with Rivers

#15. *Continents and Currencies

#16. Countries without any Mountains

#17. Highest Peak and Longest River by Country



