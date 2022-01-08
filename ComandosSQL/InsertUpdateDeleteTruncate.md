# INSERT, UPDATE, DELETE, TRUNCATE

### INSERT
Para insertar datos en la tabla `Libro`:
``` SQL
INSERT INTO Libro(IdLibro, Titulo, SubTitulo, Editorial, Area, AnioPublicacion, TotalPaginas, Edicion)
VALUES ('L1', 'Artificial Intelligence', 'A modern Approach', 'Pearson', 'IA', '2010', '1115', '3 Edicion');

INSERT INTO Libro 
VALUES ('L2', 'Fracciones', 'Matematica Basica', 'Aguilar', 'Matematica', '1988', '400', '2 Edicion');
```

### UPDATE
Para actualizar registros de la tabla `Libro` que cumplan una condición específica:
``` SQL
UPDATE Libro SET Editorial = 'Santillana', Area = 'AI'
WHERE IdLibro = 'L1';

UPDATE Libro SET Titulo = 'Divisiones'
WHERE IdLibro = 'L2';
```

### DELETE
Para eliminar registros de la tabla `Libro` que cumplan una condición específica:
``` SQL
DELETE From Libro WHERE IdLibro = 'L1';
```

### TRUNCATE
Para eliminar todos los registros de la tabla `Libro`:
``` SQL
TRUNCATE TABLE Libro;
```
