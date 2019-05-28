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