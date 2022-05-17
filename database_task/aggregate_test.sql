CREATE DATABASE IF NOT EXISTS gameshopdbtwo;

USE gameshopdbtwo;

CREATE TABLE IF NOT EXISTS customers (
customer_id int auto_increment,
first_name varchar(50),
surname varchar(50),
PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS products (
product_id int auto_increment,
product_name varchar(50) NOT NULL,
price DECIMAL(10,4) NOT NULL,
-- (10 (referring to how many numbers in total - 123456.7899), 4 (referring to number of decimal places))
quantity int,
PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS orders (
order_id INT auto_increment,
fk_customer_id INT,
fk_product_id INT,
order_address varchar(255),
PRIMARY KEY (order_id),
FOREIGN KEY (fk_customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
FOREIGN KEY (fk_product_id) REFERENCES products(product_id) ON DELETE CASCADE
);