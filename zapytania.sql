#WHERE, AND, OR, ORDER BY
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT * FROM `customers` WHERE country = "Germany";
SELECT * FROM `customers` WHERE city = "Berlin";
SELECT * FROM `customers` WHERE city = "Berlin" AND country = "Germany";
SELECT * FROM `customers` WHERE (city = "Berlin" OR city="München") AND country = "Germany";
SELECT * FROM `customers` WHERE NOT country = "Germany" AND NOT country = "USA";
SELECT * FROM `customers` ORDER BY country ASC;
SELECT * FROM `customers` ORDER BY country DESC;
SELECT * FROM `customers` ORDER BY country DESC, customer_name ASC;

#MIN, MAX, COUNT, AVG, SUM, GROUP BY    
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT MIN(price) FROM `products`;
SELECT MAX(price) FROM `products`;
SELECT COUNT(*) FROM `products`;
SELECT COUNT(*) FROM `customers`;
SELECT country, COUNT(*) FROM `customers` GROUP BY country;
SELECT COUNT(category_id), AVG(price) FROM `products` WHERE category_id=1;
SELECT SUM(price) FROM `products` WHERE category_id=2;
SELECT category_id, MAX(price) FROM `products` WHERE category_id=1 OR category_id=2 GROUP BY category_id;

#BETWEEN, NOT BETWEEN, IN, NOT IN, SUBQUERY
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT * FROM `products` WHERE price BETWEEN 10 AND 20;
SELECT * FROM `products` WHERE price NOT BETWEEN 10 AND 20;
SELECT * FROM `products` WHERE category_id IN (1,2,3);
SELECT * FROM `orders` WHERE shipper_id IN (1,2,3);
SELECT * FROM `products` WHERE (price BETWEEN 10 AND 15) AND (category_id NOT BETWEEN 1 AND 4);
SELECT * FROM `orders` WHERE order_date BETWEEN CAST('19960701' as date) AND CAST('19960731' as date);
SELECT * FROM `orders` WHERE customer_id IN( SELECT id FROM customers WHERE id BETWEEN 77 AND 90 );

#JOIN, INNER JOIN, LEFT JOIN, RIGHT JOIN, Self Join
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT * FROM `customers` LEFT JOIN orders ON customers.id=orders.customer_id ORDER BY customers.id ASC;
SELECT customers.id, customers.customer_name,COUNT(orders.customer_id) FROM `customers` LEFT JOIN orders ON customers.id=orders.customer_id GROUP BY orders.customer_id;
SELECT DISTINCT customers.id, customers.customer_name, customers.contact_name, customers.address, customers.city, customers.post_code, customers.country FROM `customers` JOIN orders ON customers.id=orders.customer_id ORDER BY customers.id ASC;
SELECT employees.id, employees.last_name, employees.first_name, orders.id FROM `employees` RIGHT JOIN orders ON employees.id = orders.employee_id ORDER BY orders.employee_id;
SELECT A.customer_name AS name1, B.customer_name AS name2, A.City FROM customers A, customers B WHERE A.id <> B.id AND A.city = B.city ORDER BY A.city;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#LIMIT, OFFSET
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT * FROM `orders` LIMIT 10 OFFSET 10;
SELECT * FROM `orders` ORDER BY id DESC LIMIT 10;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#HAVING , EXISTS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT country FROM `customers` GROUP BY country HAVING COUNT(country)>5;
SELECT * FROM `customers` WHERE EXISTS (SELECT * FROM orders WHERE customers.id = orders.customer_id HAVING COUNT(orders.customer_id) BETWEEN 2 AND 4) ORDER BY customers.id DESC;
SELECT * FROM `employees` WHERE EXISTS (SELECT * FROM orders WHERE employees.id = orders.employee_id HAVING COUNT(orders.employee_id)>10);
SELECT * FROM `employees` WHERE last_name="Davolio" OR last_name="Fuller" AND EXISTS (SELECT * FROM orders WHERE employees.id = orders.employee_id HAVING COUNT(orders.employee_id)>25);
SELECT * FROM `suppliers` WHERE EXISTS (SELECT * FROM products WHERE suppliers.id = products.supplier_id AND products.price<20);
SELECT * FROM `suppliers` WHERE EXISTS (SELECT * FROM products WHERE suppliers.id = products.supplier_id AND products.price=22);

#CASE
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT products.name, CASE WHEN orders_details.quantity > 30 THEN "Liczba sztuk jest większa niż 30" WHEN orders_details.quantity = 30 THEN "Liczba sztuk jest równa 30" ELSE "Liczba sztuk jest mniejsza niż 30" END AS liczba_sztuk FROM products JOIN orders_details ON products.id = orders_details.product_id;
SELECT * FROM `customers` ORDER BY (CASE WHEN city IS NULL THEN country ELSE city END);

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#ALL
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT products.id, products.name, SUM(orders_details.quantity) AS ilość FROM `products` JOIN orders_details ON products.id = orders_details.product_id GROUP BY(products.name) ORDER BY `ilość` DESC LIMIT 10;
SELECT customers.id, customers.customer_name, COUNT(orders.customer_id) AS liczba_zamówień FROM `customers` JOIN orders ON customers.id = orders.customer_id GROUP BY (customers.customer_name) ORDER BY `liczba_zamówień` DESC LIMIT 10;
SELECT categories.id, categories.category_name, COUNT(products.category_id) AS ilość FROM `categories` JOIN products ON categories.id = products.category_id GROUP BY categories.category_name ORDER BY ilość DESC LIMIT 1;


-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-