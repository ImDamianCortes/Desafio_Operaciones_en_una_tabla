--
-- Parte 1: Creación, inserciones, modificaciones y eliminaciones en la tabla “Posts”
--

1. Crear una base de datos con nombre “Posts”.

-- creando base de datos

CREATE DATABASE Posts;

2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
contenido y descripción.

-- creando tabla

CREATE TABLE post(
id SERIAL PRIMARY KEY,
nombre_de_usuario VARCHAR(50),
fecha_de_creacion DATE,
contenido VARCHAR(50),
descripcion VARCHAR(100)
);

SELECT * FROM post;

 id | nombre_de_usuario | fecha_de_creacion | contenido | descripcion
----+-------------------+-------------------+-----------+-------------
(0 filas)

3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".

INSERT INTO post(
nombre_de_usuario,
fecha_de_creacion,
contenido,
descripcion)

VALUES ('Pamela', '2022-03-11', 'contenido 1er post Pamela', '1er post Pamela'),
('Pamela', '2022-03-11', 'contenido 2do post Pamela', '2do post Pamela'),
('Carlos', '2022-03-11', 'contenido 1er post Carlos', '1er post Carlos');

SELECT * FROM post;

 id | nombre_de_usuario | fecha_de_creacion |         contenido         |   descripcion
----+-------------------+-------------------+---------------------------+-----------------
  1 | Pamela            | 2022-03-11        | contenido 1er post Pamela | 1er post Pamela
  2 | Pamela            | 2022-03-11        | contenido 2do post Pamela | 2do post Pamela
  3 | Carlos            | 2022-03-11        | contenido 1er post Carlos | 1er post Carlos
(3 filas)

4. Modificar la tabla post, agregando la columna título.

ALTER TABLE post ADD titulo VARCHAR(30);

SELECT * FROM post;

 id | nombre_de_usuario | fecha_de_creacion |         contenido         |   descripcion   | titulo
----+-------------------+-------------------+---------------------------+-----------------+--------
  1 | Pamela            | 2022-03-11        | contenido 1er post Pamela | 1er post Pamela |
  2 | Pamela            | 2022-03-11        | contenido 2do post Pamela | 2do post Pamela |
  3 | Carlos            | 2022-03-11        | contenido 1er post Carlos | 1er post Carlos |
(3 filas)

5. Agregar título a las publicaciones ya ingresadas.

UPDATE post SET titulo = 'Post 01' WHERE id = 1;
UPDATE post SET titulo = 'Post 02' WHERE id = 2;
UPDATE post SET titulo = 'Post 03' WHERE id = 3;

SELECT * FROM post;

 id | nombre_de_usuario | fecha_de_creacion |         contenido         |   descripcion   | titulo
----+-------------------+-------------------+---------------------------+-----------------+---------
  1 | Pamela            | 2022-03-11        | contenido 1er post Pamela | 1er post Pamela | Post 01
  2 | Pamela            | 2022-03-11        | contenido 2do post Pamela | 2do post Pamela | Post 02
  3 | Carlos            | 2022-03-11        | contenido 1er post Carlos | 1er post Carlos | Post 03
(3 filas)

6. Insertar 2 post para el usuario "Pedro".

INSERT INTO post(
nombre_de_usuario,
fecha_de_creacion,
contenido,
descripcion,
titulo)

VALUES ('Pedro', '2022-03-11', 'contenido 1er post Pedro', '1er post Pedro', 'Post 04'),
('Pedro', '2022-03-11', 'contenido 2do post Pedro', '2do post Pedro', 'Post 05');

 id | nombre_de_usuario | fecha_de_creacion |         contenido         |   descripcion   | titulo
----+-------------------+-------------------+---------------------------+-----------------+---------
  1 | Pamela            | 2022-03-11        | contenido 1er post Pamela | 1er post Pamela | Post 01
  2 | Pamela            | 2022-03-11        | contenido 2do post Pamela | 2do post Pamela | Post 02
  3 | Carlos            | 2022-03-11        | contenido 1er post Carlos | 1er post Carlos | Post 03
  4 | Pedro             | 2022-03-11        | contenido 1er post Pedro  | 1er post Pedro  | Post 04
  5 | Pedro             | 2022-03-11        | contenido 2do post Pedro  | 2do post Pedro  | Post 05
(5 filas)

7. Eliminar el post de Carlos.

DELETE FROM post WHERE nombre_de_usuario = 'Carlos';

SELECT * FROM post;

 id | nombre_de_usuario | fecha_de_creacion |         contenido         |   descripcion   | titulo
----+-------------------+-------------------+---------------------------+-----------------+---------
  1 | Pamela            | 2022-03-11        | contenido 1er post Pamela | 1er post Pamela | Post 01
  2 | Pamela            | 2022-03-11        | contenido 2do post Pamela | 2do post Pamela | Post 02
  4 | Pedro             | 2022-03-11        | contenido 1er post Pedro  | 1er post Pedro  | Post 04
  5 | Pedro             | 2022-03-11        | contenido 2do post Pedro  | 2do post Pedro  | Post 05
(4 filas)


8. Ingresar un nuevo post para el usuario "Carlos".

INSERT INTO post(
nombre_de_usuario,
fecha_de_creacion,
contenido,
descripcion,
titulo)

VALUES ('Carlos', '2022-03-11', 'contenido nuevo post Pedro', 'nuevo post Pedro', 'Post 06');

SELECT * FROM post;

 id | nombre_de_usuario | fecha_de_creacion |         contenido          |   descripcion    | titulo
----+-------------------+-------------------+----------------------------+------------------+---------
  1 | Pamela            | 2022-03-11        | contenido 1er post Pamela  | 1er post Pamela  | Post 01
  2 | Pamela            | 2022-03-11        | contenido 2do post Pamela  | 2do post Pamela  | Post 02
  4 | Pedro             | 2022-03-11        | contenido 1er post Pedro   | 1er post Pedro   | Post 04
  5 | Pedro             | 2022-03-11        | contenido 2do post Pedro   | 2do post Pedro   | Post 05
  6 | Carlos            | 2022-03-11        | contenido nuevo post Carlos | nuevo post Carlos | Post 06
(5 filas)


--
-- Parte 2: Creación e inserciones en la tabla “comentarios”
--

1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
creación y contenido, que se relacione con la tabla posts.

CREATE TABLE comentarios(
id SERIAL PRIMARY KEY,
-- no se incluye como requisito pero se añade para identificar
post_id INT,
fecha DATE,
hora_de_creacion TIME,
contenido VARCHAR(50),
FOREIGN KEY (post_id) REFERENCES post(id)
);

SELECT * FROM comentario;

 id | post_id | fecha | hora_de_creacion | contenido
----+---------+-------+------------------+-----------
(0 filas)

2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".

INSERT INTO comentarios(
post_id,
fecha,
hora_de_creacion,
contenido)

VALUES (01, '2022-03-11', '02:00:00', 'comentario 01'),
(02, '2022-03-11', '02:00:00', 'comentario 02'),
(06, '2022-03-11', '02:00:00', 'comentario 01'),
(06, '2022-03-11', '02:00:00', 'comentario 02'),
(06, '2022-03-11', '02:00:00', 'comentario 03'),
(06, '2022-03-11', '02:00:00', 'comentario 04');

3. Crear un nuevo post para "Margarita".

INSERT INTO post(
nombre_de_usuario,
fecha_de_creacion,
contenido,
descripcion,
titulo)

VALUES ('Margarita', '2022-03-11', 'contenido nuevo post Margarita', 'nuevo post Margarita', 'Post 07');

SELECT * FROM post;

 id | nombre_de_usuario | fecha_de_creacion |           contenido            |     descripcion      | titulo
----+-------------------+-------------------+--------------------------------+----------------------+---------
  1 | Pamela            | 2022-03-11        | contenido 1er post Pamela      | 1er post Pamela      | Post 01
  2 | Pamela            | 2022-03-11        | contenido 2do post Pamela      | 2do post Pamela      | Post 02
  4 | Pedro             | 2022-03-11        | contenido 1er post Pedro       | 1er post Pedro       | Post 04
  5 | Pedro             | 2022-03-11        | contenido 2do post Pedro       | 2do post Pedro       | Post 05
  6 | Carlos            | 2022-03-11        | contenido nuevo post Pedro     | nuevo post Pedro     | Post 06
  7 | Margarita         | 2022-03-11        | contenido nuevo post Margarita | nuevo post Margarita | Post 07
(6 filas)

4. Ingresar 5 comentarios para el post de Margarita.

INSERT INTO comentarios(
post_id,
fecha,
hora_de_creacion,
contenido)

VALUES (07, '2022-03-11', '02:00:00', 'comentario 01'),
(07, '2022-03-11', '02:05:00', 'comentario 02'),
(07, '2022-03-11', '02:16:00', 'comentario 03'),
(07, '2022-03-11', '02:19:00', 'comentario 04'),
(07, '2022-03-11', '02:22:00', 'comentario 05');

SELECT * FROM comentarios WHERE post_id = 7;

 id | post_id |   fecha    | hora_de_creacion |   contenido
----+---------+------------+------------------+---------------
  7 |       7 | 2022-03-11 | 02:00:00         | comentario 01
  8 |       7 | 2022-03-11 | 02:05:00         | comentario 02
  9 |       7 | 2022-03-11 | 02:16:00         | comentario 03
 10 |       7 | 2022-03-11 | 02:19:00         | comentario 04
 11 |       7 | 2022-03-11 | 02:22:00         | comentario 05
(5 filas)