DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore;

USE bookstore;

CREATE TABLE locations (
	location_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	adress VARCHAR(65) UNIQUE NOT NULL,
    zip VARCHAR(65),
    -- time open
    -- time close
    mo_op int,
    mo_cl int,
    tu_op int,
    tu_cl int,
    we_op int,
    we_cl int,
    th_op int,
    th_cl int,
    fr_op int,
    fr_cl int,
    sa_op int,
    sa_cl int,
    su_op int,
    su_cl int
    -- MO8-16_TU8-16_WE8-16_TH8-16_FR8-16_SA8-16_SU-1 
);
    
CREATE TABLE employees (
	employee_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(65) NOT NULL,
    adress VARCHAR(65) NOT NULL,
    location_id INT UNSIGNED,
    CONSTRAINT fke_location FOREIGN KEY (location_id) REFERENCES locations(location_id),
	-- shift start
	-- shift end
    mo_st int,
	mo_end int,
    tu_st int,
    tu_end int,
    we_st int,
    we_end int,
    th_st int,
    th_end int,
    fr_st int,
    fr_end int,
    sa_st int,
    sa_end int,
    su_st int,
    su_end int
);  

CREATE TABLE authors(
	author_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(65) NOT NULL
);

CREATE TABLE publishers(
	publisher_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(65) NOT NULL
);

CREATE TABLE customers (
	customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(65) NOT NULL,
    balance FLOAT(9,2)
);  

CREATE TABLE books(
	book_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    isbn INT UNSIGNED NOT NULL,
    title VARCHAR(65) NOT NULL,
    genre VARCHAR(65) NOT NULL,
    price FLOAT(9,2),
    author_id INT UNSIGNED,
    publisher_id INT UNSIGNED,
    location_id INT UNSIGNED,
    CONSTRAINT fkb_author FOREIGN KEY (author_id) REFERENCES authors(author_id),
    CONSTRAINT fkb_publisher FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id),
    CONSTRAINT fkb_location FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE rentals (
	rental_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    returned INT UNSIGNED,
    date_rented DATE,
    date_due DATE,
    customer_id INT UNSIGNED,
    book_id INT UNSIGNED,
    CONSTRAINT fkr_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fkr_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE purchases (
	purchase_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    date_purchased DATE,
    customer_id INT UNSIGNED,
    book_id INT UNSIGNED,
    CONSTRAINT fkp_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fkp_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO locations (location_id, adress, zip, mo_op,tu_op,we_op,th_op,fr_op,sa_op,su_op,mo_cl,tu_cl,we_cl,th_cl,fr_cl,sa_cl,su_cl)
VALUES 
(1, '111 one st', 91402, 8,8,8,8,8,8,0,17,17,17,17,17,17,0),
(2, '222 two ln', 91402, 8,8,8,8,8,0,0,17,17,17,17,17,0,0),
(3, '333 three blvd', 00503, 8,8,8,8,8,8,8,17,17,17,17,17,17,17);

INSERT INTO employees (employee_id, name, adress, location_id, mo_st,tu_st,we_st,th_st,fr_st,sa_st,su_st,mo_end,tu_end,we_end,th_end,fr_end,sa_end,su_end)
VALUES
(1, 'paul smith', '123 house st', 1, 0,0,8,8,8,8,0,0,0,16,16,16,16,0),
(2, 'peter cole', '234 bulding st', 1, 8,8,0,0,8,8,0,16,16,0,0,16,16,0),
(3, 'taylor tran', '212 block st', 1, 8,8,8,8,8,8,0,16,16,16,16,16,16,0),
(4, 'kevin johnson', '532 brick st', 2, 8,8,8,8,8,0,0,16,16,16,16,16,0,0),
(5, 'tyler miller', '567 path st', 2, 8,8,8,8,8,0,0,16,16,16,16,16,0,0),
(6, 'alex davis', '236 house st', 2, 8,8,8,8,8,0,0,16,16,16,16,16,0,0),
(7, 'jose lopez', '143 tar st', 3, 0,8,8,8,8,8,0,0,16,16,16,16,16,0),
(8, 'robert cruz', '227 blue st', 3, 8,8,0,0,8,8,8,16,16,0,0,16,16,16),
(9, 'chris small', '432 wave st', 3, 8,8,0,0,8,8,8,16,16,0,0,16,16, 16),
(10, 'alonzo garcia', '111 first st', 3, 8,8,8,8,8,8,8,16,16,16,16,16,16,16);

INSERT INTO customers (customer_id, name, balance)
VALUES 
(1, 'michael richards', 0),
(2, 'regie barns', 0),
(3, 'brain lopez', -5),
(4, 'jonathon miller', 0),
(5, 'bob carter', -3),
(6, 'jimmy campbell', 0),
(7, 'paul martin', 0),
(8, 'edna jones', 0),
(9, 'justin gustowski', -1),
(10, 'joshua galvez', -5);


INSERT INTO publishers (publisher_id, name)
VALUES
(1, 'Scholastic'),
(2, 'Penguin'),
(3, 'Random'),
(4, 'HarperCollins'),
(5, 'Pearson');

INSERT INTO authors (author_id, name)
VALUES
(1, 'Ernest Hemingway'),
(2, 'William Shakespeare'), 
(3, 'Apple Jordan'),
(4, 'John Steinbeck'),
(5, 'J.K Rowling');


INSERT INTO books (book_id, isbn, title, genre, price, author_id, publisher_id, location_id)
VALUES
(1, 133556292 , 'The Sun also Rises', 'adventure', 80, 1, 1,1),
(2, 804488255 , 'Romeo and Juliet', 'romance', 12, 2, 2,1),
(3, 804488352 , 'Much ado about nothin', 'comedy', 14, 2, 2,1),
(4, 233223332 , 'Dragon Tales', 'childrens', 9, 3, 2,1),
(5, 233223333 , 'Dragon Tales 2', 'childrens', 9, 3, 2,1),
(6, 353234233 , 'Of Mice and Men', 'fiction', 18, 4, 1,1),
(7, 156344355 , 'Harry Potter and the Sorcerer’s Stone', 'fantasy', 24, 5, 1,1),
(8, 156344356 , 'Harry Potter and the Chamber of Secrets', 'fantasy', 24, 5, 1,1),
(9, 156344357 , 'Harry Potter and the Prisoner of Azkaban', 'fantasy', 24, 5, 1,1),
(10, 133556292 , 'The Sun also Rises', 'adventure', 80, 1, 1,2),
(11, 804488255 , 'Romeo and Juliet', 'romance', 12, 2, 2,2),
(12, 804488352 , 'Much ado about nothin', 'comedy', 14, 2, 2,2),
(13, 233223332 , 'Dragon Tales', 'childrens', 9, 3, 2,2),
(14, 233223333 , 'Dragon Tales 2', 'childrens', 9, 3, 2,2),
(15, 353234233 , 'Of Mice and Men', 'fiction', 18, 4, 1,2),
(16, 133556292 , 'The Sun also Rises', 'adventure', 80, 1, 1,3),
(17, 804488255 , 'Romeo and Juliet', 'romance', 12, 2, 2,3),
(18, 804488352 , 'Much ado about nothin', 'comedy', 14, 2, 2,3),
(19, 353234233 , 'Of Mice and Men', 'fiction', 18, 4, 1,3),
(20, 156344355 , 'Harry Potter and the Sorcerer’s Stone', 'fantasy', 24, 5, 1,3),
(21, 156344356 , 'Harry Potter and the Chamber of Secrets', 'fantasy', 24, 5, 1,3),
(22, 156344357 , 'Harry Potter and the Prisoner of Azkaban', 'fantasy', 24, 5, 1,3);

INSERT INTO rentals (rental_id, returned, date_rented, date_due, customer_id, book_id)
VALUES
(1, 1, '2023-06-01', '2023-06-06', 1, 1),
(2, 1, '2023-06-14', '2023-06-19', 3, 13),
(3, 0, '2023-06-15', '2023-06-20', 3, 14),
(4, 0, '2023-06-19', '2023-07-9', 5, 1),
(5, 0, '2023-07-02', '2023-07-15', 7, 20),
(6, 0, '2023-07-06', '2023-07-15', 7, 21),
(7, 0, '2023-07-8', '2023-07-15', 7, 22),
(8, 1, '2023-07-9', '2023-07-11', 1, 12);

INSERT INTO purchases (purchase_id, date_purchased, customer_id, book_id)
VALUES
(1, '2023-6-4', 1,2),
(2, '2023-6-14', 2,2),
(3, '2023-6-24', 3,2),
(4, '2023-7-2', 8,2),
(5, '2023-7-9', 9,20),
(6, '2023-7-9', 9,21),
(7, '2023-7-9', 9,22),
(8, '2023-7-14', 2,3),
(9, '2023-7-14', 2,1),
(10, '2023-7-14', 1,12);


SELECT * FROM locations; 
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM purchases ;

INSERT INTO locations (location_id, adress, mo_op,tu_op,we_op,th_op,fr_op,sa_op,su_op,mo_cl,tu_cl,we_cl,th_cl,fr_cl,sa_cl,su_cl) VALUES (8, '888 8 st', 8,8,8,8,8,8,0,17,17,17,17,17,17,0);

UPDATE locations SET adress='1111 one st' WHERE location_id = 1;

DELETE FROM locations WHERE location_id=8;

SELECT * FROM locations WHERE zip = 91402;

SELECT * FROM locations WHERE location_id = 2;
-- by location employee hours worked
SELECT employee_id, employees.location_id, name, (mo_end - mo_st + tu_end - tu_st + we_end - we_st + th_end - th_st + fr_end - fr_st + sa_end - sa_st + su_end - su_st) AS total_hours FROM employees INNER JOIN locations ON locations.location_id = employees.location_id WHERE locations.location_id = 1 ORDER BY total_hours DESC;
-- employees who work a certain day by location
SELECT employee_id, employees.location_id, name, mo_end , mo_st FROM employees INNER JOIN locations ON locations.location_id = employees.location_id WHERE locations.location_id = 1 AND (mo_end - mo_st) > 0;
-- employee of the month(most hours)
SELECT employee_id, employees.location_id, name, (mo_end - mo_st + tu_end - tu_st + we_end - we_st + th_end - th_st + fr_end - fr_st + sa_end - sa_st + su_end - su_st) AS total_hours FROM employees INNER JOIN locations ON locations.location_id = employees.location_id ORDER BY total_hours DESC LIMIT 1;
-- employees who worked overtime
SELECT employee_id, employees.location_id, name, (mo_end - mo_st + tu_end - tu_st + we_end - we_st + th_end - th_st + fr_end - fr_st + sa_end - sa_st + su_end - su_st) AS total_hours FROM employees INNER JOIN locations ON locations.location_id = employees.location_id WHERE (mo_end - mo_st + tu_end - tu_st + we_end - we_st + th_end - th_st + fr_end - fr_st + sa_end - sa_st + su_end - su_st) > 40 ORDER BY total_hours DESC;
-- view individual customer books rented (inlcude books rented) 
SELECT * FROM purchases INNER JOIN customers ON purchases.customer_id = customers.customer_id INNER JOIN books ON purchases.book_id = books.book_id WHERE customers.customer_id = 9;
SELECT purchase_id, date_purchased, name, title, price FROM purchases INNER JOIN customers ON purchases.customer_id = customers.customer_id INNER JOIN books ON purchases.book_id = books.book_id WHERE customers.customer_id = 9;
-- pay off balance
UPDATE customers SET balance = 0 WHERE customer_id = 9;

-- cutomers total spending in order
SELECT purchases.customer_id, name, SUM(price) AS total_spent FROM purchases INNER JOIN customers ON purchases.customer_id = customers.customer_id INNER JOIN books ON purchases.book_id = books.book_id GROUP BY customer_id ORDER BY total_spent DESC;

-- cutomers who have spent a certain amount of money
SELECT purchases.customer_id, name, SUM(price) AS total_spent FROM purchases INNER JOIN customers ON purchases.customer_id = customers.customer_id INNER JOIN books ON purchases.book_id = books.book_id GROUP BY customer_id ORDER BY total_spent DESC;

-- all books rented by customers by certain author
SELECT purchases.customer_id, customers.name, title, author_id FROM purchases INNER JOIN customers ON purchases.customer_id = customers.customer_id INNER JOIN books ON purchases.book_id = books.book_id WHERE books.author_id = 5;
-- SELECT * FROM purchases INNER JOIN customers ON purchases.customer_id = customers.customer_id INNER JOIN books ON purchases.book_id = books.book_id INNER JOIN authors ON books.author_id = authors.author_id WHERE books.author_id = 5;

-- customer who rent from more than one location
SELECT customer_id FROM (SELECT customers.customer_id, locations.location_id FROM rentals INNER JOIN customers ON rentals.customer_id = customers.customer_id INNER JOIN books ON rentals.book_id = books.book_id INNER JOIN locations ON books.location_id = locations.location_id GROUP BY customers.customer_id, locations.location_id) AS t GROUP BY customer_id, location_id HAVING count(customer_id) > 1;

SELECT customers.customer_id, locations.location_id FROM rentals INNER JOIN customers ON rentals.customer_id = customers.customer_id INNER JOIN books ON rentals.book_id = books.book_id INNER JOIN locations ON books.location_id = locations.location_id GROUP BY customers.customer_id, locations.location_id ;

-- view books by author
SELECT * FROM books WHERE author_id = 2;

-- view books by genre
SELECT * FROM books WHERE genre = 'romance';

-- check if a book is avaialbale at a location
SELECT * from books WHERE NOT book_id IN (SELECT book_id FROM rentals WHERE returned = 0) AND location_id = 2;

-- view rental history for a book
SELECT * FROM rentals WHERE book_id = 1;

-- view rentals that are past due
SELECT rental_id, date_rented, date_due, rentals.customer_id, name, balance FROM rentals INNER JOIN customers ON customers.customer_id = rentals.customer_id WHERE returned = 0 and date_due < current_date();

-- return a rental
UPDATE rentals SET returned = 1 WHERE customer_id = 3;

-- view purchases by book or customer
SELECT * FROM purchases WHERE customer_id = 1;
SELECT * FROM purchases WHERE book_id = 1;
