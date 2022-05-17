USE my_gameshop;


INSERT INTO customers(full_name, email)
	VALUES('John Doe', 'johndoe@email.com');
INSERT INTO customers (full_name, email) 
    VALUES('Jane Doe', 'janedoe@email.com');
INSERT INTO customers (full_name, email)
	VALUES('Gerry Atrics', 'gerryatric@nhs.com');

INSERT INTO product(product_name, product_price)
	VALUES('Call of Duty', 40.99);
INSERT INTO product (product_name, product_price) 
	VALUES('GTA VI', 55.99);
INSERT INTO product (product_name, product_price) 
	VALUES('Elder Scrolls 6: Deluxe', 75.99);
INSERT INTO product (product_name, product_price) 
	VALUES('The Witcher 4', 45.99);

INSERT INTO orders(fk_customer_id, fk_product_id)
	VALUES(10000, 1);
INSERT INTO orders (fk_customer_id, fk_product_id) 
	VALUES(10002, 3);
INSERT INTO orders (fk_customer_id, fk_product_id) 
	VALUES(10001, 2);