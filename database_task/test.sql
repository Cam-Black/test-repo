CREATE DATABASE IF NOT EXISTS test;

USE test;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    forename CHAR(20) NOT NULL,
    surname CHAR(20) NOT NULL,
    email VARCHAR(50) UNIQUE,
    mobile_no BIGINT UNIQUE DEFAULT NULL,
    account_creation_date DATETIME DEFAULT current_timestamp
);

INSERT INTO customers (forename, surname, email, mobile_no) VALUES('John', 'Doe', 'johndoe@email.com', 0874156), ('Jane', 'Doe', 'janedoe@exists.com', 07842941726), ('William', 'Wallace','forfreedom@scotland.free', 01213456234);

SELECT * FROM customers;

INSERT INTO customers (forename, surname, email) VALUES('Jonathan', 'Davis', 'korn@numetal.org');

INSERT INTO customers (forename, surname, email) VALUES('Corey', 'Taylor', 'slipknot@kerrang.tv');

SELECT * FROM customers;

UPDATE customers SET forename='Jon', surname='smith' WHERE customer_id=1;
UPDATE customers SET mobile_no='0100001066' WHERE forename='William';

SELECT * FROM customers;

DELETE FROM customers WHERE mobile_no IS NULL;

SELECT * FROM customers;