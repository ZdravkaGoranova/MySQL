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


-- 3







-- 4