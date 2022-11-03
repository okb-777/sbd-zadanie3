SELECT * FROM `customers` WHERE country = "Germany";
SELECT * FROM `customers` WHERE city = "Berlin";
SELECT * FROM `customers` WHERE city = "Berlin" AND country = "Germany";
SELECT * FROM `customers` WHERE (city = "Berlin" OR city="München") AND country = "Germany";
SELECT * FROM `customers` WHERE NOT country = "Germany" AND NOT country = "USA";
SELECT * FROM `customers` ORDER BY country ASC;
SELECT * FROM `customers` ORDER BY country DESC;
SELECT * FROM `customers` ORDER BY country DESC, customer_name ASC;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT MIN(price) FROM `products`;
SELECT MAX(price) FROM `products`;
SELECT COUNT(*) FROM `products`;
SELECT COUNT(*) FROM `customers`;
SELECT country, COUNT(*) FROM `customers` GROUP BY country;
SELECT COUNT(category_id), AVG(price) FROM `products` WHERE category_id=1;
SELECT SUM(price) FROM `products` WHERE category_id=2;
SELECT category_id, MAX(price) FROM `products` WHERE category_id=1 OR category_id=2 GROUP BY category_id;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT * FROM `products` WHERE price BETWEEN 10 AND 20;
SELECT * FROM `products` WHERE price NOT BETWEEN 10 AND 20;
SELECT * FROM `products` WHERE category_id IN (1,2,3);
SELECT * FROM `orders` WHERE shipper_id IN (1,2,3);
SELECT * FROM `products` WHERE (price BETWEEN 10 AND 15) AND (category_id NOT BETWEEN 1 AND 4);
SELECT * FROM `orders` WHERE order_date BETWEEN CAST('19960701' as date) AND CAST('19960731' as date);
SELECT * FROM `orders` WHERE customer_id IN( SELECT id FROM customers WHERE id BETWEEN 77 AND 90 );

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SELECT * FROM `customers` LEFT JOIN orders ON customers.id=orders.customer_id ORDER BY customers.id ASC;
SELECT customers.id, customers.customer_name,COUNT(orders.customer_id) FROM `customers` LEFT JOIN orders ON customers.id=orders.customer_id GROUP BY orders.customer_id;
SELECT DISTINCT customers.id, customers.customer_name, customers.contact_name, customers.address, customers.city, customers.post_code, customers.country FROM `customers` JOIN orders ON customers.id=orders.customer_id ORDER BY customers.id ASC;
SELECT employees.id, employees.last_name, employees.first_name, orders.id FROM `employees` RIGHT JOIN orders ON employees.id = orders.employee_id ORDER BY orders.employee_id;
SELECT A.customer_name AS name1, B.customer_name AS name2, A.City FROM customers A, customers B WHERE A.id <> B.id AND A.city = B.city ORDER BY A.city;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

