CREATE DATABASE IF NOT EXISTS my_gameshop;

USE my_gameshop;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS product;

CREATE TABLE IF NOT EXISTS customers (
	customer_id INT auto_increment PRIMARY KEY,
    full_name CHAR(40) NOT NULL,
    email CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS product (
	product_id INT auto_increment PRIMARY KEY,
    product_name CHAR(50) NOT NULL,
    product_price FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
	order_id INT auto_increment PRIMARY KEY,
    fk_customer_id INT NOT NULL,
    fk_product_id INT NOT NULL,
    order_date DATETIME DEFAULT current_timestamp,
    FOREIGN KEY (fk_customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (fk_product_id) REFERENCES product(product_id)
);

INSERT INTO customers(full_name, email)
	VALUES('John Doe', 'johndoe@email.com');
INSERT INTO product(product_name, product_price)
	VALUES('Call of Duty', 40.99);
INSERT INTO orders(fk_customer_id, fk_product_id)
	VALUES(1, 1);