USE tienda;

-- 1. List the name of all products in the product table.
SELECT nombre FROM producto;

-- 2. List the names and prices of all products in the product table.
SELECT nombre, precio FROM producto;

-- 3. List all columns from the product table.
SELECT * FROM producto;

-- 4. List the names of the products, the price in euros, and the price in US dollars (USD).
SELECT nombre, precio AS precio_EUR , ROUND(precio * 1.18, 2) AS precio_USD FROM producto;

-- 5. List the names of the products, the price in euros, and the price in US dollars (USD). Use the following aliases for the columns: product_name, euros, dollars.
SELECT nombre AS nombre_de_producto, precio AS euros , ROUND(precio * 1.18, 2) AS dòlars FROM producto;

-- 6. List the names and prices of all products in the product table, converting the names to uppercase.
SELECT UPPER(nombre) AS nombre, precio FROM producto;

-- 7. List the names and prices of all products in the product table, converting the names to lowercase.
SELECT LOWER(nombre) AS nombre, precio FROM producto;

-- 8. List the names of all manufacturers in one column, and in another column obtain the first two characters of the manufacturer's name in uppercase.
SELECT nombre , LEFT (UPPER(nombre), 2) AS Siglas FROM fabricante;

-- 9. List the names and prices of all products in the product table, rounding the price value.
SELECT nombre, ROUND(precio) AS precio FROM producto;

-- 10. List the names and prices of all products in the product table, truncating the price value to show it without any decimal digits.
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;

-- 11. List the code of manufacturers that have products in the product table.
SELECT fabricante.codigo FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

-- 12. List the code of manufacturers that have products in the product table, removing any duplicate codes.
SELECT DISTINCT fabricante.codigo FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo; 

-- 13. List the names of manufacturers sorted in ascending order.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. List the names of manufacturers sorted in descending order.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. List the names of products ordered first by name in ascending order and second by price in descending order.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Return a list with the first 5 rows from the manufacturer table.
SELECT * FROM fabricante LIMIT 5;

-- 17. Return a list with 2 rows starting from the fourth row of the manufacturer table. The fourth row should also be included in the response.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. List the name and price of the cheapest product. (Only use the ORDER BY and LIMIT clauses). NOTE: You cannot use MIN(price) here; you need GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. List the name and price of the most expensive product. (Only use the ORDER BY and LIMIT clauses). NOTE: You cannot use MAX(price) here; you need GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. List the name of all products from the manufacturer whose manufacturer code is equal to 2.

SELECT nombre FROM producto WHERE producto.codigo_fabricante = 2;

-- 21. Return a list with the name of the product, price, and manufacturer name of all products in the database.
SELECT p.nombre AS nombre_producto , p.precio AS precio, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante;

-- 22. Return a list with the name of the product, price, and manufacturer name of all products in the database. Sort the result by manufacturer's name in alphabetical order.
SELECT p.nombre AS nombre_producto , p.precio AS precio, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante ORDER BY nombre_fabricante ASC;

-- 23. Return a list with the product code, product name, manufacturer code, and manufacturer name for all products in the database.
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto AS p
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante;

-- 24. Return the name of the product, its price, and the name of its manufacturer for the cheapest product.
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
ORDER BY precio_producto ASC LIMIT 1;

-- 25. Return the name of the product, its price, and the name of its manufacturer for the most expensive product.
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
ORDER BY precio_producto DESC LIMIT 1;

-- 26. Return a list of all products from the manufacturer Lenovo.
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "Lenovo";

-- 27. Return a list of all products from the manufacturer Crucial that have a price greater than 200 €.
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "Crucial" AND p.precio > 200;

-- 28. Return a list of all products from the manufacturers Asus, Hewlett-Packard, and Seagate without using the IN operator.
SELECT p.nombre AS nombre_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante 
WHERE f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate";

-- 29. Return a list of all products from the manufacturers Asus, Hewlett-Packard, and Seagate using the IN operator.
SELECT p.nombre AS nombre_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante 
WHERE f.nombre IN ("Asus", "Hewlett-Packard", "Seagate");

-- 30. Return a list with the name and price of all products from manufacturers whose names end with the vowel e.
SELECT p.nombre AS nombre_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante 
WHERE f.nombre LIKE "%e";

-- 31. Return a list with the name and price of all products whose manufacturer's name contains the character w in its name.
SELECT p.nombre AS nombre_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante 
WHERE f.nombre LIKE "%w%";

-- 32. Return a list with the product name, price, and manufacturer name of all products that have a price greater than or equal to 180 €. Sort the result, first by price (in descending order) and second by name (in ascending order).
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE p.precio >= 180
ORDER BY p.precio DESC , p.nombre DESC;

-- 33. Return a list with the code and name of the manufacturer, only for those manufacturers that have associated products in the database.
SELECT DISTINCT f.nombre FROM fabricante AS f 
JOIN producto AS p ON  p.codigo_fabricante = f.codigo;

-- 34. Return a list of all manufacturers that exist in the database, along with the products each of them has. The list should also show those manufacturers that do not have associated products.
SELECT f.nombre AS Fabricante, p.nombre  AS producto FROM fabricante AS f 
LEFT JOIN producto AS p ON  p.codigo_fabricante = f.codigo;

-- 35. Return a list that only includes those manufacturers that do not have any associated products.
SELECT f.nombre AS Fabricante FROM fabricante AS f 
LEFT JOIN producto AS p ON  p.codigo_fabricante = f.codigo
WHERE p.nombre IS NULL;

-- 36. Return all products from the manufacturer Lenovo. (Without using INNER JOIN).
SELECT p.nombre AS nombre_producto FROM producto AS p
WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante AS f WHERE f.nombre = "Lenovo");

-- 37. Return all data from products that have the same price as the most expensive product of the manufacturer Lenovo. (Without using INNER JOIN).
SELECT * FROM producto 
WHERE precio = (SELECT MAX(precio) FROM producto
 WHERE codigo_fabricante = (SELECT codigo FROM fabricante f 
 WHERE f.nombre = "Lenovo"));

-- 38. List the name of the most expensive product from the manufacturer Lenovo.
SELECT p.nombre AS nombre_producto FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
WHERE f.nombre = "Lenovo"
ORDER BY p.precio DESC LIMIT 1;

-- 39. List the name of the cheapest product from the manufacturer Hewlett-Packard.
SELECT p.nombre AS nombre_producto FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
WHERE f.nombre = "Hewlett-Packard"
ORDER BY p.precio ASC LIMIT 1;

-- 40. Return all products from the database that have a price greater than or equal to the most expensive product from the manufacturer Lenovo.
-- I have done two solutions.
-- Solution 1:
SELECT p.nombre AS nombre_producto , p.precio AS precio FROM producto AS p
WHERE p.precio >= (SELECT p.precio FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
WHERE f.nombre = "Lenovo"
ORDER BY p.precio DESC LIMIT 1);

-- Solution 2
SELECT p.nombre AS nombre_producto , p.precio AS precio FROM producto AS p
WHERE p.precio >= (SELECT MAX(p.precio) FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
WHERE f.nombre = "Lenovo");

-- 41. List all products from the manufacturer Asus that have a price higher than the average price of all their products.
SELECT p.nombre AS nombre_producto , p.precio AS precio FROM producto AS p
WHERE p.precio >= (SELECT AVG(p.precio) FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "Asus")
      AND p.codigo_fabricante = (SELECT f.codigo FROM fabricante AS f WHERE f.nombre = "Asus") ;
