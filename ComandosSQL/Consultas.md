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
