# CONSULTAS

### SELECT
Para obtener todos los registros de la tabla `Libro` y mostrar todos sus campos:
``` SQL
SELECT * FROM Libro;
```
Para obtener todos los registros de la tabla `Libro` y mostrar los campos `IdLibro` y `Titulo`:
``` SQL
SELECT IdLibro, Titulo
FROM Libro;
```

### DISTINCT
Para obtener todos los distintos valores de `Carrera` de la tabla `Estudiante`:
``` SQL
SELECT DISTINCT Carrera 
FROM Estudiante;
```
Para obtener la cantidad de los distintos valores de `Carrera` de la tabla `Estudiante`:
``` SQL
SELECT COUNT(DISTINCT Carrera) 
FROM Estudiante;
```

### WHERE 
Para obtener los registros de la tabla `Estudiante` donde se cumpa la condición `Carrera`='Sistemas':
``` SQL
SELECT * FROM Estudiante
WHERE Carrera = 'Sistemas';
```
Para obtener los registros de la tabla `Estudiante` donde `Edad` sea entre 18 y 20:
``` SQL
SELECT * FROM Estudiante
WHERE Edad BETWEEN 18 AND 20;
```
Para obtener los registros de la tabla `Libro` donde `Titulo` empiece por 'a':
``` SQL
SELECT * FROM Libro
WHERE Titulo LIKE 'a%';
```
Para obtener los registros de la tabla `Estudiante` donde `Carrera` tenga los valores 'Sistemas', 'Industrial':
``` SQL 
SELECT * FROM Estudiante
WHERE Carrera IN('Sistemas', 'Industrial');
```

### ORDER BY
Para obtener los registros de la tabla `Estudiante` ordenados por `Nombre` ascendentemente:
``` SQL 
SELECT * FROM Estudiante
ORDER BY Nombre ASC;
```
Para obtener los registros de la tabla `Estudiante` ordenados por `Nombre` descendentemente:
``` SQL 
SELECT * FROM Estudiante
ORDER BY Nombre DESC;
```

### TOP
Para obtener primeros 3 registros de la tabla `Libro`:
``` SQL 
SELECT TOP 3 *
FROM Libro;
```

### MIN, MAX
Para el mínimo valor de `Edad` en los registros de `Estudiante`:
``` SQL 
SELECT MIN(Edad) AS MenorEdad
FROM Estudiante;
```
Para el máximo valor de `Edad` en los registros de `Estudiante`:
``` SQL 
SELECT MAX(Edad) AS MenorEdad
FROM Estudiante;
```

### COUNT, AVG, SUM
Para el contar cuantos registros de `Estudiante` existen:
``` SQL 
SELECT COUNT(*) AS Cantidad
FROM Estudiante;
```
Para el calcular el promedio de la `Edad` de los registros de `Estudiante`:
``` SQL 
SELECT AVG(Edad) AS EdadPromedio
FROM Estudiante;
```
Para el sumar la `Edad` de todos los registros de `Estudiante`:
``` SQL 
SELECT SUM(Edad) AS SumaEdad
FROM Estudiante;
```

