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
begin
return(
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
end $$

SELECT UFN_COUNT_EMPLOYEES_BY_TOWN('Edmonds') AS count


# 2. Employees Promotion

# 3. Employees Promotion by ID

# 4. Triggered
