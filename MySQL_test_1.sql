/* Creating Databases and Tables */
CREATE DATABASE hly_test_1;
DROP DATABASE hly_test_2;
USE hly_test_1;
SELECT database();

CREATE TABLE cats_1
(
 name VARCHAR(100),
 age INT
 );
SHOW TABLES;
SHOW COLUMNS FROM cats;
DESC cats;
DROP TABLE cats_1;

CREATE TABLE pastries
(
 name VARCHAR(50),
 quantity INT
 );
/* Inserting Data (and a couple other things) */
 INSERT INTO cats (name,age)
 VALUES  ('Cat_1',66)
INSERT INTO cats (age,name)
 VALUES  (16,"Cat_2");

 SELECT * FROM cats;

 INSERT INTO cats (name,age)
 VALUES  ('Cat_3',9),
         ('Cat_4',6),
         ('Cat_5',8);

 INSERT INTO cats (name);

 VALUES  ('Cat_3');
CREATE TABLE cats_2
(
 name VARCHAR(100) NOT NULL,
 age INT NOT NULL
 );

INSERT INTO cats_2 (name)
 VALUES  ('Cat_3');

 //error
 INSERT INTO cats_2 (name,age)
 VALUES  ('Cat_3',9);

 CREATE TABLE cats_3
(
 name VARCHAR(10) NOT NULL,
 age INT NOT NULL
 );

 INSERT INTO cats_3 (name,age)
 VALUES  ('Cat_345454545454',9);
 //error

  INSERT INTO cats_3 (name,age)
 VALUES  ('Cat_364','ABCD');

CREATE TABLE cat_4(
     name VARCHAR(20) DEFAULT 'unnamed',
     age INT DEFAULT 99
);

CREATE TABLE cats_5(
     catID INT NOT  NULL ,
     name VARCHAR(20) DEFAULT 'unnamed',
     age INT DEFAULT 99,
     PRIMARY KEY (catID)
);

 INSERT INTO cats_5 (catID,name,age)
 VALUES  (1,'Cat_364',3),
                (1,'Cat_3',3) ;
//error

CREATE TABLE cats_6(
     catID INT NOT  NULL AUTO_INCREMENT ,
     name VARCHAR(20) DEFAULT 'unnamed',
     age INT DEFAULT 99,
     PRIMARY KEY (catID)
);

 INSERT INTO cats_6 (name,age)
 VALUES  ('Cat_364',3),
                ('Cat_3',3) ;


/* CRUD commmands */
CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 
SELECT * FROM cats;
SELECT name FROM cats;
SELECT name,age FROM cats;
SELECT * FROM cats WHERE age=4;
SELECT cat_id AS id FROM cats;
UPDATE cats SET breed='Shorthair' 
WHERE breed='Tabby' ;
UPDATE cats SET name='Jack' 
WHERE name='Jackson' ;
DELETE FROM cats WHERE name="Egg";

/* CRUD Challenge Section */
--    Create
CREATE DATABASE Shirts;
USE Shirts;
CREATE TABLE shirts
(
     shirt_id INT NOT NULL AUTO_INCREMENT,
     article VARCHAR(50),
     color VARCHAR(10),
     shirt_size VARCHAR(5),
     last_worn INT,
     PRIMARY KEY(shirt_id)
 );

 INSERT INTO shirts (article,color,shirt_size,last_worn)
 VALUES
  ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

 INSERT INTO shirts (article,color,shirt_size,last_worn)
 VALUES
  ('purple', 'polo shirt', 'M', 50);
--   Read
SELECT article ,color FROM shirts;
SELECT article,color,shirt_size,last_worn FROM shirts WHERE shirt_size='M';

-- Update
Update shirts SET shirt_size='L',color='too white' WHERE article='polo shirt';
Update shirts SET last_worn=0 WHERE last_worn=15;
Update shirts SET shirt_size='XS',color='off white' WHERE color='white';
-- Delete
DELETE FROM shirts WHERE last_worn>=200;
DELETE FROM shirts WHERE article ="tank top";
DELETE FROM shirts;
DROP TABLE shirts;
DROP DATABASE Shirts;

/* String Functions */
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

  SELECT CONCAT(author_fname," ",author_lname) FROM   books;
  SELECT author_fname AS first_name ,CONCAT(author_fname," ",author_lname)  FROM   books;
  SELECT CONCAT_WS(' - ',title,author_fname,author_lname,released_year) FROM books;
  SELECT SUBSTRING('Hello World',1,4); /* begin from 1,output Hell */
  SELECT SUBSTRING('Hello World',7); /* from 7 to end */
  SELECT SUBSTRING('Hello World',-4); /* last 4 */
  SELECT SUBSTRING(title,1,10) FROM books;
  SELECT CONCAT(SUBSTRING(title,1,10),"...") AS short_title FROM books;
  SELECT REPLACE('Hello World','Hell','****');
  SELECT REPLACE(title,'e','4') FROM books;
  SELECT REVERSE(released_year) FROM books;
  SELECT CONCAT(released_year,REVERSE(released_year)) FROM books;
  SELECT title,CHAR_LENGTH(title) AS length_of_title FROM books ;
  SELECT UPPER('AaDf');
  SELECT LOWER('AaDf');

/*   Refining Selections */
SELECT DISTINCT author_fname FROM books;
SELECT DISTINCT author_fname,author_lname FROM books;
SELECT  author_fname FROM books ORDER BY author_fname;
SELECT  author_fname,author_lname 
FROM books 
ORDER BY author_fname,author_lname;
SELECT title,released_year 
FROM books 
ORDER BY released_year DESC
LIMIT 3;
/* Equal */ 

SELECT title,released_year 
FROM books 
ORDER BY released_year DESC
LIMIT 0,3; /*  table is 0 starting ,string is 1 starting */

SELECT title,released_year 
FROM books 
ORDER BY released_year DESC
LIMIT 3,18729817928173; /*  max */

SELECT * FROM books WHERE author_fname LIKE '%da%'; /* '%'  match any lenght of char */
SELECT * FROM books WHERE stock_quantity LIKE '____';   /* '_' only match one char */
SELECT * FROM books WHERE title LIKE '%\%%';   /* \% mean % \ is escaping sign*/
SELECT * FROM books WHERE title LIKE '%\_%'; 


SELECT title FROM books WHERE title LIKE '%stories%';
SELECT title,pages FROM books ORDER BY pages DESC LIMIT 1;
SELECT CONCAT(title,' - ',released_year) FROM books ORDER BY released_year DESC LIMIT 3;
SELECT title,author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title,released_year,stock_quantity FROM books ORDER BY stock_quantity,title LIMIT 3;
SELECT title,author_lname FROM books ORDER BY author_lname,title;
SELECT CONCAT('MFA is ',author_fname,' ',author_lname ) FROM books ORDER BY author_lname;

/* Aggregate Functions*/
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname,author_lname) FROM books;
SELECT  title FROM books WHERE title LIKE '%the%';

SELECT author_lname ,COUNT(title)
FROM books
GROUP BY author_lname;
SELECT author_fname,author_lname,COUNT(title)
FROM books
GROUP BY author_fname,author_lname;
SELECT  released_year ,COUNT(released_year) FROM books GROUP BY released_year;

SELECT Min(released_year) FROM books;
SELECT * FROM books
WHERE pages=
(
     SELECT MAX(pages) FROM books  /* not ; */
);

SELECT * FROM books
ORDER BY pages 
LIMIT 1;

SELECT author_fname,author_lname,MIN(released_year)
FROM books
GROUP BY author_fname,author_lname;

SELECT SUM(pages) FROM books;


SELECT CONCAT(author_fname,' ',author_lname) AS full_name,SUM(pages)
FROM books
GROUP BY author_fname,author_lname;

SELECT AVG(pages) FROM books;

SELECT released_year,AVG(stock_quantity)
FROM books
GROUP BY released_year ORDER BY AVG(stock_quantity);

SELECT COUNT(title) FROM books;

SELECT released_year,COUNT(*) FROM books GROUP BY released_year ;

SELECT SUM(stock_quantity) FROM books;
SELECT  author_fname,author_lname,AVG(released_year) FROM books GROUP BY author_fname,author_lname;
SELECT CONCAT(author_fname," ",author_lname) FROM books
ORDER BY pages DESC LIMIT 1;
SELECT released_year,COUNT(*) AS '# books',
AVG(pages) AS 'avg_pages'
FROM books GROUP BY released_year ORDER BY released_year;


/*  Data Types Advanced */


CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle'); /* with a empty place */
INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever'); /* name too long ,error , can't insert  */

SELECT * FROM dogs;
INSERT INTO dogs (name, breed) VALUES ('Jane', 'Retrievesadfdsafdasfsafr');/* breed too long ,alse error , can't insert  */
SELECT * FROM dogs;

CREATE TABLE items(price DECIMAL(5,2));

INSERT INTO items(price) VALUES(7);

INSERT INTO items(price) VALUES(7987654);/* price too large , error , can't insert  */

INSERT INTO items(price) VALUES(34.88);

INSERT INTO items(price) VALUES(298.9999); /* can insert but lose all digit after decimal point */

INSERT INTO items(price) VALUES(1.9999);/* can insert but lose all digit after decimal point */

SELECT * FROM items;

CREATE TABLE coordinate (x FLOAT);

INSERT INTO coordinate(x) VALUES (88.45); /* OK */

INSERT INTO coordinate(x) VALUES (8877.45); /* OK */

INSERT INTO coordinate(x) VALUES (8877665544.45);/*  lose precision */

SELECT * FROM coordinate;

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-205', '04:10:402', '19043-12-25 04:10:42'); /* format error */

SELECT * FROM people;
SELECT CURDATE(),CURTIME(),NOW() FROM people;

SELECT name, birthdate FROM people;

SELECT name, DAY(birthdate) FROM people;

SELECT name, birthdate, DAY(birthdate) FROM people;

SELECT name, birthdate, DAYNAME(birthdate) FROM people;

SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;

SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;

SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;

SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;

SELECT name, birthdt, MONTH(birthdt) FROM people;

SELECT name, birthdt, MONTHNAME(birthdt) FROM people;

SELECT name, birthtime, HOUR(birthtime) FROM people;

SELECT name, birthtime, MINUTE(birthtime) FROM people;

SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;

SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;

SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;

SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;


SELECT * FROM people;

SELECT DATEDIFF(NOW(), birthdate) FROM people;

SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;

SELECT birthdt FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;

SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;

SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;

SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments (content) VALUES('lol what a funny article');

INSERT INTO comments (content) VALUES('I found this offensive');

INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');

SELECT * FROM comments ORDER BY created_at DESC;

CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO comments2 (content) VALUES('dasdasdasd');

INSERT INTO comments2 (content) VALUES('lololololo');

INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');

UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';

SELECT * FROM comments2;

SELECT * FROM comments2 ORDER BY changed_at;

CREATE TABLE comments3 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
    /*same as  changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP */
);
INSERT INTO comments3 (content) VALUES('dasdasdasd');

INSERT INTO comments3 (content) VALUES('lololololo');

INSERT INTO comments3 (content) VALUES('I LIKE CATS AND DOGS');
UPDATE comments3 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';

SELECT CURTIME();

SELECT DAY(NOW());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(),'%w');
SELECT DATE_FORMAT(NOW(),'%w');
SELECT DATE_FORMAT(NOW(),'%W');
SELECT DATE_FORMAT(NOW(),'%w');
SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');
SELECT DATE_FORMAT(NOW(),'%M %D at %h:%i');

CREATE TABLE tweets_1(
     name_id INT,
    content VARCHAR(140),
    created_at TIMESTAMP DEFAULT NOW()
);

/* Logical Operators */
SELECT title FROM books WHERE released_year = 2017;

SELECT title FROM books WHERE released_year != 2017;

SELECT title, author_lname FROM books;

SELECT title, author_lname FROM books WHERE author_lname = 'Harris';

SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

SELECT title FROM books WHERE title LIKE 'W%';

SELECT title FROM books WHERE title NOT LIKE 'W%';

SELECT title, released_year FROM books ORDER BY released_year;

SELECT title, released_year FROM books 
WHERE released_year > 2000 ORDER BY released_year;

SELECT title, released_year FROM books 
WHERE released_year >= 2000 ORDER BY released_year;

SELECT title, stock_quantity FROM books;

SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

SELECT 99 > 1; /*  return 1 */

SELECT 99 > 567;  /* return 0 */

SELECT title, released_year FROM books;

SELECT title, released_year FROM books
WHERE released_year < 2000;

SELECT title, released_year FROM books
WHERE released_year <= 2000;


SELECT  
    title, 
    author_lname, 
    released_year FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010;

SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    && title LIKE '%novel%';


SELECT title, 
       author_lname, 
       released_year, 
       stock_quantity 
FROM   books 
WHERE  author_lname = 'Eggers' 
              || released_year > 2010 
              OR     stock_quantity > 100;

SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;

SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;

SELECT CAST('2017-05-02' AS DATETIME);

SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';

SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);

SELECT title, author_lname FROM books

SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;

/* same as  */
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'  /*  order importance ,only match only */
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 


SELECT title,released_year FROM books 
WHERE released_year<1980;

SELECT title,author_lname FROM books
WHERE author_lname IN ('Eggers','Chabon');

SELECT title,author_fname,author_lname,released_year FROM books
WHERE released_year>=2000
&&(author_fname='Lahiri'||  author_lname='Lahiri');

SELECT title,pages FROM books
WHERE pages BETWEEN 100 AND 200;

SELECT title,author_lname FROM books
WHERE author_lname LIKE 'C%' ||author_lname LIKE 'S%';

SELECT title,author_lname FROM books
WHERE SUBSTRING(author_lname,1,1) IN ('C','S');

SELECT title,author_lname,
CASE
   WHEN title LIKE '%Kids%' ||title LIKE '%Heartbreaking%' THEN 'Memoir'
   WHEN title LIKE '%stories'  THEN 'Short_Stories'
   ELSE 'Novel'
END AS TYPE 
FROM books;

SELECT title,author_lname,
CASE 
   WHEN COUNT(title)=1 THEN CONCAT(COUNT(title),' book')
   ELSE CONCAT(COUNT(title),' books')
END AS 'COUNT'
FROM books GROUP BY author_lname;

/* Multi Table, One to Many */
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)  /* foreign key */
);

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98); /* error if not user have id of 98 */

SELECT * FROM orders WHERE customer_id=
(
  SELECT id FROM customers
  WHERE last_name='George'


);

SELECT * FROM customers ,orders; /* cross join, all combinaion */
SELECT * FROM customers ,orders WHERE customers.id=orders.customer_id; /* inner join ,impilict */
SELECT * FROM customers 
INNER JOIN orders
ON  customers.id=orders.customer_id; /* inner join ,expilict */

SELECT first_name,last_name,SUM(amount) AS total_spent FROM customers 
INNER JOIN orders
ON  customers.id=orders.customer_id
GROUP BY customer_id
ORDER BY total_spent DESC;
/* operate on join table */

SELECT first_name,
           last_name,
           IFNULL(SUM(amount) ,0) AS total_spent/*   avoid NULL */
FROM customers 
LEFT JOIN orders
ON  customers.id=orders.customer_id
GROUP BY customers.id
ORDER BY total_spent DESC;
 
 SELECT *
 FROM customers 
RIGHT JOIN orders
ON  customers.id=orders.customer_id;
 /* in this case ,same as INNER JOIN */

  SELECT *
 FROM customers 
RIGHT JOIN orders
ON  customers.id=orders.amount;
 /* in this case ,left are all null */

CREATE TABLE customers_wdc(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders_wdc(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
     REFERENCES customers_wdc(id) 
       ON DELETE CASCADE/*   turn on ON DELETE CASCADE */
     /* foreign key */
);
DELETE FROM customers_wdc WHERE first_name='boy';
/* order with customer_id=1 also deleted */

CREATE TABLE students(
   id INT NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(20),
   PRIMARY KEY(id)
);
CREATE TABLE papers(
   title VARCHAR(200),
   grade INT,
   student_id INT,
   FOREIGN KEY (student_id)
   REFERENCES students(id)
);
SELECT first_name,title,grade FROM  students
INNER JOIN papers
ON students.id=papers.student_id;

SELECT first_name,title,grade FROM  students
INNER JOIN papers
ON students.id=papers.student_id
ORDER BY grade DESC;

SELECT first_name,title,grade FROM  students
LEFT JOIN papers
ON students.id=papers.student_id;

SELECT first_name,
             AVG(IFNULL(grade,0)) AS average
FROM  students
LEFT JOIN papers
ON students.id=papers.student_id
GROUP BY students.id
ORDER BY average DESC; 


SELECT first_name,
             AVG(IFNULL(grade,0)) AS average,
             CASE
            WHEN AVG(IFNULL(grade,0))>=60 THEN 'PASSING'
            ELSE  'FAILING'
             END AS passing_status
FROM  students
LEFT JOIN papers
ON students.id=papers.student_id
GROUP BY students.id
ORDER BY average DESC; 


/*  Many to Many */
CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);
SELECT title,rating FROM series
INNER JOIN reviews
ON series.id=reviews.series_id 
&& title IN ('Archer','Arrested Development',"Bob's Burgers");

SELECT title,AVG(rating) AS avg_rating FROM series
INNER JOIN reviews
ON series.id=reviews.series_id 
GROUP BY series.id
ORDER BY avg_rating;

SELECT first_name,last_name,rating FROM reviewers
INNER JOIN reviews
ON reviews.reviewer_id=reviewers.id
&& reviewers.first_name in ('Thomas','Wyatt','Kimbra'); 

SELECT title AS unreviewed_series FROM
 () AS TABLE_1
WHERE Rating=-1;

SELECT title AS unreviewed_series    FROM series
LEFT JOIN reviews
ON series.id=reviews.series_id
WHERE rating IS NULL;

SELECT genre,ROUND(AVG(rating),2) FROM series
INNER JOIN  reviews
 ON series.id=reviews.series_id
 GROUP BY genre;


 SELECT first_name,last_name,
     IFNULL(COUNT(rating),0) AS COUNT, 
     IFNULL( MIN(rating),0) AS MIN,  IFNULL(MAX(rating),0) AS MAX,
  IFNULL(AVG(rating),0)AS AVG,
/*   CASE 
WHEN COUNT(rating)=0 THEN 'INACTIVE'
ELSE 'ACTIVE' 
END AS STATUS */
IF(COUNT(rating)>=1,'ACTIVE','INACTIVE') AS STATUS
FROM reviewers
LEFT JOIN reviews
 ON reviewers.id=reviews.reviewer_id
 GROUP BY reviewers.id
 ORDER BY MAX DESC;
 

 SELECT title,rating,CONCAT(first_name,' ',last_name) AS reviewer
 FROM (
   SELECT title ,rating,reviews.reviewer_id AS _reviewer_id
   FROM series 
   INNER JOIN reviews
   ON series.id=reviews.series_id
   WHERE title IN ( 'Archer','Arrested Development',"Bob's Burgers")
 ) AS TABLE_1
 INNER JOIN reviewers
 ON _reviewer_id=reviewers.id;


 SELECT title,rating,CONCAT(first_name,' ',last_name) AS reviewer
  FROM series 
   INNER JOIN reviews
   ON series.id=reviews.series_id
 INNER JOIN reviewers
 ON reviewer_id=reviewers.id
    WHERE title IN ( 'Archer','Arrested Development',"Bob's Burgers");