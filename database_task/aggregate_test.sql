CREATE DATABASE IF NOT EXISTS my_new_shop;

USE my_new_shop;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers (
customer_id int auto_increment,
first_name varchar(50),
surname varchar(50),
home_address varchar(100),
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
PRIMARY KEY (order_id),
FOREIGN KEY (fk_customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (fk_product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_name, price, quantity) VALUES ('bag', 9.99,10), ('hat', 15.99,40), ('laptop', 1009.99, 59), ('Water', 0.99, 17), ('Ball', 10.00, 16);

INSERT INTO customers (first_name, surname, home_address) VALUES ('Jordan', 'Benbelaid', 'Utah'), ('Jordan', 'Smith', 'Greenland'), ('Sarah', 'Holt', 'Moscow'), ('Lucy', 'Holt', 'Kiev');

INSERT INTO orders (fk_customer_id, fk_product_id) VALUES (3, 4), (1, 3), (3, 1), (2, 1), (2, 4);