-- Data Aggregation - Exercise
-- 01. Records’ Count
SELECT 
    COUNT(*)
FROM
    gringotts.wizzard_deposits;

-- 02. Longest Magic Wand
SELECT 
    MAX(magic_wand_size) AS 'longest_magic_wand'
FROM
    gringotts.wizzard_deposits;

-- 03. Longest Magic Wand per Deposit Groups
SELECT 
    deposit_group, MAX(magic_wand_size) AS 'longest_magic_wand'
FROM
    gringotts.wizzard_deposits
GROUP BY deposit_group
ORDER BY `longest_magic_wand` , deposit_group ASC;

-- 04. Smallest Deposit Group per Magic Wand Size
SELECT 
    deposit_group, 
    magic_wand_size
FROM
    gringotts.wizzard_deposits;
    
-- 05. Deposits Sum
SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    gringotts.wizzard_deposits
GROUP BY deposit_group
order by `total_sum`;

-- 6. Deposits Sum for Ollivander Family
SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    gringotts.wizzard_deposits
WHERE
    magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group
;

-- 7. Deposits Filter
SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    gringotts.wizzard_deposits
WHERE
    magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;