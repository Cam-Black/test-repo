USE my_new_shop;

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

SELECT orders.order_id, customers.customer_id AS `Customer ID`, customers.first_name AS Name, products.product_name AS `Product Name`, products.price AS Price
	FROM customers JOIN orders ON customers.customer_id=orders.fk_customer_id
    INNER JOIN products ON products.product_id=orders.fk_product_id ORDER BY orders.order_id;
    
SELECT p.product_name AS Product, p.price AS Price FROM orders o INNER JOIN products p ON p.product_id=o.fk_product_id ORDER BY o.order_id;

SELECT o.order_id AS `Order No`, c.first_name AS `First Name`, p.product_name AS Product, p.price AS Price FROM products p INNER JOIN orders o ON p.product_id=o.fk_product_id
	INNER JOIN customers c ON c.customer_id=o.fk_customer_id ORDER BY o.order_id;