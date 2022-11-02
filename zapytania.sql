SELECT * FROM `customers` WHERE country = "Germany";
SELECT * FROM `customers` WHERE city = "Berlin";
SELECT * FROM `customers` WHERE city = "Berlin" AND country = "Germany";
SELECT * FROM `customers` WHERE (city = "Berlin" OR city="München") AND country = "Germany";
SELECT * FROM `customers` WHERE NOT country = "Germany" AND NOT country = "USA";
SELECT * FROM `customers` ORDER BY country ASC;
SELECT * FROM `customers` ORDER BY country DESC;
SELECT * FROM `customers` ORDER BY country DESC, customer_name ASC;

SELECT MIN(price) FROM `products`;
SELECT MAX(price) FROM `products`;
SELECT COUNT(*) FROM `products`;
SELECT COUNT(*) FROM `customers`;
SELECT country, COUNT(*) FROM `customers` GROUP BY country;
SELECT COUNT(category_id), AVG(price) FROM `products` WHERE category_id=1;
SELECT SUM(price) FROM `products` WHERE category_id=2;
SELECT category_id, MAX(price) FROM `products`WHERE category_id=1 OR category_id=2 GROUP BY category_id;
