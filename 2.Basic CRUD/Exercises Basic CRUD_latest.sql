
-- 21
USE geography;
SELECT 
    peak_name
FROM
    peaks
ORDER BY peak_name;

-- 22

SELECT 
    country_name, population
FROM
    countries
    WHERE continent_code ='EU'
ORDER BY population DESC , country_name ASC
LIMIT 30;


-- 23

SELECT 
    country_name,
    country_code,
    IF(currency_code = 'Euro',
        'EURO',
        'Not Euro')
FROM
    countries
ORDER BY country_name ASC;


-- 23

SELECT 
    country_name,
    country_code,
    IF(currency_code = 'EUR',
        'Euro',
        'Not Euro') as currency
FROM
    countries
ORDER BY country_name ASC;

-- 24

SELECT 
    name
FROM
    characters
ORDER BY name ASC;