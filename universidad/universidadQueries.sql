-- universidad' queries
-- 1. Return a list with the first surname, second surname, and the name of all students. The list should be ordered alphabetically from lowest to highest by the first surname, second surname, and name.
SELECT p.apellido1 AS Apellido_1, p.apellido2 AS Appellido_2, p.nombre AS Nombre 
FROM universidad.persona AS p
WHERE p.tipo = "alumno"
ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 2. Find the name and both surnames of students who have not registered their phone number in the database.
SELECT p.apellido1 AS Apellido_1, p.apellido2 AS Appellido_2, p.nombre AS Nombre 
FROM universidad.persona AS p
WHERE p.tipo = "alumno" AND p.telefono IS NULL
ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 3. Return the list of students born in 1999.
SELECT * FROM universidad.persona AS p 
WHERE p.tipo = "alumno" AND EXTRACT(YEAR FROM p.fecha_nacimiento) = '1999';

-- 4. Return the list of professors who have not registered their phone number in the database and whose NIF ends with K.
SELECT * FROM universidad.persona AS p
WHERE p.tipo = "profesor" AND p.telefono IS NULL AND p.nif LIKE "%K" ;

-- 5. Return the list of subjects taught in the first semester, in the third year of the degree with the identifier 7.
SELECT * FROM universidad.asignatura as a
WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado =  7;

-- 6. Return a list of professors along with the name of the department to which they are linked. The list should return four columns: first surname, second surname, name, and department name. The result should be ordered alphabetically from lowest to highest by surname and name.
SELECT p.apellido1 AS Apellido_1,  p.apellido2 AS Apellido_2, p.nombre AS Nombre, d.nombre as Departamento
FROM universidad.profesor AS pro
JOIN universidad.persona AS p ON p.id = pro.id_profesor
JOIN universidad.departamento as d ON d.id = pro.id_departamento
ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 7. Return a list with the name of the subjects, start year, and end year of the academic year for the student with NIF 26902806M.
SELECT a.nombre AS Asignatura, anyo_inicio, anyo_fin FROM universidad.alumno_se_matricula_asignatura as am
JOIN universidad.curso_escolar AS ce ON ce.id = am.id_curso_escolar
JOIN universidad.persona AS p ON p.id = am.id_alumno
JOIN universidad.asignatura AS a ON a.id = am.id_asignatura
WHERE p.nif = "26902806M";

-- 8. Return a list of all departments that have professors teaching any subjects in the Degree in Computer Engineering (Plan 2015).
SELECT DISTINCT g.nombre AS Grado, d.nombre AS Departamento FROM  universidad.asignatura AS a
JOIN universidad.profesor AS p ON p.id_profesor = a.id_profesor
JOIN universidad.grado AS g ON g.id = a.id_grado
JOIN universidad.departamento AS d ON d.id = p.id_departamento
WHERE g.nombre = "Grado en Ingeniería Informática (Plan 2015)";

-- 9. Return a list of all students who have enrolled in any subject during the academic year 2018/2019.
SELECT DISTINCT apellido1, apellido2, nombre FROM universidad.persona AS p
JOIN universidad.alumno_se_matricula_asignatura AS am ON p.id = am.id_alumno
JOIN universidad.curso_escolar AS ce ON ce.id = am.id_curso_escolar
WHERE ce.anyo_inicio = "2018" AND ce.anyo_fin = "2019";

-- LEFT JOIN & RIGHT JOIN
-- 1. Return a list with the names of all professors and the departments they are linked to. The list should also show those professors who do not have any associated department. The list should return four columns: department name, first surname, second surname, and professor's name. The result should be ordered alphabetically from lowest to highest by department name, surname, and name.
SELECT d.nombre AS Departamento, p.apellido1, p.apellido2, p.nombre
FROM  universidad.persona AS p
LEFT JOIN universidad.profesor AS pro ON pro.id_profesor = p.id
LEFT JOIN universidad.departamento AS d ON d.id = pro.id_departamento
WHERE p.tipo = "profesor"
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 2. Return a list of professors who are not associated with any department.
SELECT p.apellido1, p.apellido2, p.nombre
FROM  universidad.persona AS p
LEFT JOIN universidad.profesor AS pro ON pro.id_profesor = p.id
LEFT JOIN universidad.departamento AS d ON d.id = pro.id_departamento
WHERE p.tipo = "profesor" AND d.nombre IS NULL
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 3. Return a list of departments that do not have any associated professors.
SELECT DISTINCT d.nombre FROM universidad.departamento AS d
LEFT JOIN universidad.profesor AS pro ON pro.id_departamento = d.id
WHERE id_profesor IS NULL;

-- 4. Return a list of professors who do not teach any subjects.
SELECT p.apellido1, p.apellido2, p.nombre, a.nombre
FROM  universidad.persona AS p
LEFT JOIN universidad.asignatura a ON a.id_profesor = p.id
WHERE p.tipo = "profesor" AND a.nombre IS NULL;

-- 5. Return a list of subjects that do not have an assigned professor.
SELECT a.nombre FROM universidad.asignatura AS a
LEFT JOIN universidad.profesor AS pro ON pro.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;

-- 6. Return a list of all departments that have not taught any subjects in any academic year.
SELECT DISTINCT d.nombre AS Departamento FROM universidad.departamento AS d
LEFT JOIN universidad.profesor AS pro ON pro.id_departamento = d.id
LEFT JOIN universidad.asignatura AS a ON a.id_profesor = pro.id_profesor
LEFT JOIN universidad.alumno_se_matricula_asignatura AS am ON am.id_asignatura = pro.id_profesor
LEFT JOIN universidad.curso_escolar AS ce ON ce.id = am.id_curso_escolar
WHERE a.nombre IS NULL AND ce.id IS NULL;

-- Resum consults

-- 1. Return the total number of students.
SELECT COUNT(*) AS TotalAlumnos FROM universidad.persona AS p
WHERE  p.tipo = "alumno";

-- 2. Calculate how many students were born in 1999.
SELECT COUNT(*) AS TotalAlumnos1999 FROM universidad.persona AS p
WHERE  p.tipo = "alumno" AND EXTRACT(YEAR FROM p.fecha_nacimiento) = '1999';

-- 3. Calculate how many professors there are in each department. The result should only show two columns: one with the department name and another with the number of professors in that department. The result should only include departments that have associated professors and should be ordered from highest to lowest by the number of professors.
SELECT d.nombre AS Departamento, COUNT(pro.id_profesor) AS TotalProfesores FROM universidad.departamento AS d
JOIN universidad.profesor AS pro ON pro.id_departamento = d.id
GROUP BY d.nombre
ORDER BY TotalProfesores DESC;

-- 4. Return a list of all departments and the number of professors in each of them. Keep in mind that there may be departments with no associated professors. These departments should also appear in the list.
SELECT d.nombre AS Departamento, COUNT(pro.id_profesor) AS TotalProfesores FROM universidad.departamento AS d
LEFT JOIN universidad.profesor AS pro ON pro.id_departamento = d.id
GROUP BY d.nombre
ORDER BY TotalProfesores DESC;

-- 5. Return a list with the name of all degrees existing in the database and the number of subjects each has. Note that there may be degrees with no associated subjects. These degrees should also appear in the list. The result should be ordered from highest to lowest by the number of subjects.
SELECT g.nombre AS Grado, COUNT(a.id) AS TotalAsignaturas FROM universidad.grado AS g
LEFT JOIN universidad.asignatura AS a ON a.id_grado = g.id
GROUP BY g.nombre
ORDER BY TotalAsignaturas DESC;
