SELECT 
    id, SUBSTRING(title,1, 3)
FROM
    book_library.books;
SELECT substring('0123456789',5);
SELECT substring('0123456789'FROM 2 FOR 5);
SELECT substring('0123456789',-1);


-- 1
SELECT 
    title
FROM
    books
WHERE
    SUBSTRING(title, 1, 3) = 'The'
ORDER BY ID;

SELECT REPLACE ('0123456789','0123','Replacement');

-- 2
SELECT 
    REPLACE(title, 'The', '***') AS title
FROM
    books
WHERE
    SUBSTRING(title, 1, 3) = 'The' 
ORDER BY ID;

 --
SELECT '  	    some',ltrim('            some') as ltrim;
SELECT '  	    some', ltrim(rtrim('               some           ')) as trim  ;
--
SELECT 
    id, CHAR_LENGTH(title), LENGTH(title)
FROM
    books;
SELECT  char_length('абвг'),length('абвг') ;
SELECT LEFT('01234', 2), SUBSTR('01234', 1, 2);
SELECT RIGHT('01234', 2), SUBSTR('01234', -2);

SELECT lower('HI ,My name is Niki');
SELECT upper('HI ,My name is Niki');


select title
from books
where lower(SUBSTRING(title,1,3))='the';

SELECT 
    title
FROM
    books
WHERE locate('the',title);


SELECT 
    title
FROM
    books
WHERE locate('the',title)>0;

SELECT 
    title
FROM
    books
WHERE locate('the',title, 3)>0;

SELECT insert('01234',2,0,'abcd');
SELECT insert('01234',2,2,'abcd');
SELECT insert('01234',2,10,'abcd');
--
SELECT 5 / 2;
SELECT 5 DIV 2;
SELECT 5 - 2;
SELECT 5 MOD 2;
SELECT 5 % 2;

SELECT abs(6);
SELECT abs(-6);
SELECT pi();
SELECT sqrt(25);
SELECT POW(2,3);


SELECT conv(13,10,2);
SELECT conv(1001,2,10);
SELECT conv(1101,10,7);


SELECT ROUND(2.356), FLOOR(2.356), CEILING(2.356);
SELECT ROUND(2.356,2), FLOOR(-2.356), CEILING(-2.356);

SELECT FLOOR( rand()*11);
/*
[0,1)=>[0,10]
*11 ->[0;11)
FLOOR =>[0;10]
ROUND(RAND()*10)

[0,1)=>[12,25]
25+1-12=14
*(25+1-12)*14
*[0,14)
SELECT FLOOR(RAND()*(26-12)+12)


NOT working
*10 ->[0;10)
FLOOR =>[0;9]

*/
/* Date Functions

*/

SELECT extract(YEAR FROM '2023-07-14');
SELECT extract(YEAR FROM '2023/07/14');

SELECT EXTRACT(MICROSECOND FROM '2003-01-02 10:30:00.000123');
SELECT EXTRACT(DAY_MINUTE FROM '2019-07-02 01:02:03');
SELECT EXTRACT(YEAR_MONTH FROM '2019-07-02 01:02:03');

SELECT extract(YEAR FROM '2GYGYGY');
SELECT extract(YEAR FROM '12/05/2023');

SELECT * FROM BOOKS;
SELECT  title , extract(YEAR FROM year_of_release)as 'Year of realese' FROM BOOKS;

SELECT ABS( timestampdiff(YEAR, '2005-01-02','2004-01-02'));
SELECT timestampdiff(YEAR, '2006-01-02','2004-01-02');
SELECT timestampdiff(YEAR, '2004-01-02','2006-01-02');

SELECT timestampdiff(MONTH, '2004-01-02','2006-01-02');
SELECT timestampdiff(DAY, '2004-01-02','2005-01-02');

SELECT concat('Some',NULL,'other');
SELECT concat_ws('-','Some',NULL,'other');

SELECT NOW();
SELECT timestampdiff(YEAR, '2004-01-02',NOW());
-- 3
SELECT *FROM authors;
SELECT 
 first_name,
    ABS(TIMESTAMPDIFF(YEAR, born, NOW())) AS 'YEAR'
FROM
    authors;
-- 4
SELECT *FROM authors;
SELECT 
    CONCAT_WS(' ', first_name, middle_name, last_name) AS 'Full name',
    ABS(TIMESTAMPDIFF(DAY, born, died)) AS 'Days Lived'
FROM
    authors;
    
    -- 
    SELECT *FROM authors;
SELECT  date_format(born,'%d  %M  %Y' ) FROM authors;
SELECT  date_format(died,'%d  %M  %y' ) FROM authors;

/* Wildcards*/

SELECT 
    *
FROM
    books
    where title LIKE 'the%';

SELECT 
    *
FROM
    books
    where title LIKE 'a%';
    
    
    SELECT 
    *
FROM
    books
    where title REGEXP 'the';
    SELECT 
    *
FROM
    books
    where title REGEXP '^the';
    SELECT 
    *
FROM
    books
    where title REGEXP 'a%';
    
    -- 5
SELECT 
    *
FROM
    books
    WHERE title REGEXP 'Harry Potter';
    
    SELECT 
    *
FROM
    books
    WHERE title Like 'Harry Potter%';