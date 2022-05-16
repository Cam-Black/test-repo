USE my_gameshop;

INSERT INTO customers(full_name, email)
	VALUES('John Doe', 'johndoe@email.com');
INSERT INTO customers (full_name, email) 
    VALUES('Jane Doe', 'janedoe@email.com');
INSERT INTO product(product_name, product_price)
	VALUES('Call of Duty', 40.99);

INSERT INTO orders(fk_customer_id, fk_product_id)
	VALUES(1, 1);