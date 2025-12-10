USE tienda;

-- 1.
SELECT nombre FROM producto;

-- 2.
SELECT nombre, precio FROM producto;

-- 3. 
SELECT * FROM producto;

-- 4. 
SELECT nombre, precio AS precio_EUR , ROUND(precio * 1.18, 2) AS precio_USD FROM producto;

-- 5. 
SELECT nombre AS nombre_de_producto, precio AS euros , ROUND(precio * 1.18, 2) AS dòlars FROM producto;

-- 6.
SELECT UPPER(nombre) AS nombre, precio FROM producto;

-- 7.
SELECT LOWER(nombre) AS nombre, precio FROM producto;

-- 8. 
SELECT nombre , LEFT (UPPER(nombre), 2) AS Siglas FROM fabricante;

-- 9. 
SELECT nombre, ROUND(precio) AS precio FROM producto;

-- 10. 
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;

-- 11.
SELECT fabricante.codigo FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

-- 12. 
SELECT DISTINCT fabricante.codigo FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo; 

-- 13. 
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. 
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. 
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16.
SELECT * FROM fabricante LIMIT 5;

-- 17. 
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. 
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20.
SELECT nombre FROM producto WHERE producto.codigo_fabricante = 2;

-- 21. 
SELECT p.nombre AS nombre_producto , p.precio AS precio, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante;

-- 22. 
SELECT p.nombre AS nombre_producto , p.precio AS precio, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante ORDER BY nombre_fabricante ASC;

-- 23. 
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto AS p
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante;

-- 24. 
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
ORDER BY precio_producto ASC LIMIT 1;

-- 25
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
ORDER BY precio_producto DESC LIMIT 1;

-- 26. 
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "Lenovo";

-- 27. 
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "Crucial" AND p.precio > 200;

-- 28. 
SELECT p.nombre AS nombre_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante 
WHERE f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate";

-- 29. 
SELECT p.nombre AS nombre_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante 
WHERE f.nombre IN ("Asus", "Hewlett-Packard", "Seagate");

-- 30. 
SELECT p.nombre AS nombre_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante 
WHERE f.nombre LIKE "%e";

-- 31. 
SELECT p.nombre AS nombre_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante 
WHERE f.nombre LIKE "%w%";

-- 32.
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE p.precio >= 180
ORDER BY p.precio DESC , p.nombre DESC;

-- 33. 
SELECT DISTINCT f.nombre FROM fabricante AS f 
JOIN producto AS p ON  p.codigo_fabricante = f.codigo;

-- 34. 
SELECT f.nombre AS Fabricante, p.nombre  AS producto FROM fabricante AS f 
LEFT JOIN producto AS p ON  p.codigo_fabricante = f.codigo;

-- 35. 
SELECT f.nombre AS Fabricante FROM fabricante AS f 
LEFT JOIN producto AS p ON  p.codigo_fabricante = f.codigo
WHERE p.nombre IS NULL;

-- 36.
SELECT p.nombre AS nombre_producto FROM producto AS p
WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante AS f WHERE f.nombre = "Lenovo");

-- 37. 
SELECT * FROM producto 
WHERE precio = (SELECT MAX(precio) FROM producto
 WHERE codigo_fabricante = (SELECT codigo FROM fabricante f 
 WHERE f.nombre = "Lenovo"));

-- 38. 
SELECT p.nombre AS nombre_producto FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
WHERE f.nombre = "Lenovo"
ORDER BY p.precio DESC LIMIT 1;

-- 39. 
SELECT p.nombre AS nombre_producto FROM producto AS p 
JOIN fabricante AS f ON f.codigo = p.codigo_fabricante
WHERE f.nombre = "Hewlett-Packard"
ORDER BY p.precio ASC LIMIT 1;

-- 40.
-- I have tested two solutions.
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

-- 41. 
SELECT p.nombre AS nombre_producto , p.precio AS precio FROM producto AS p
WHERE p.precio >= (SELECT AVG(p.precio) FROM producto AS p JOIN fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "Asus")
      AND p.codigo_fabricante = (SELECT f.codigo FROM fabricante AS f WHERE f.nombre = "Asus") ;