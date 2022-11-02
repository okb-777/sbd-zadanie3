SELECT * FROM `customers` WHERE country = "Germany";
SELECT * FROM `customers` WHERE city = "Berlin";
SELECT * FROM `customers` WHERE city = "Berlin" AND country = "Germany";
SELECT * FROM `customers` WHERE (city = "Berlin" OR city="München") AND country = "Germany";
SELECT * FROM `customers` WHERE NOT country = "Germany" AND NOT country = "USA";
SELECT * FROM `customers` ORDER BY country ASC;
SELECT * FROM `customers` ORDER BY country DESC;
SELECT * FROM `customers` ORDER BY country DESC, customer_name ASC;