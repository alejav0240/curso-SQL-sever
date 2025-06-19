CREATE TABLE libros_al (
    codigo NUMBER(6),
    titulo VARCHAR2(100),
    autor VARCHAR2(100),
    editorial VARCHAR2(100),
    precio NUMBER(6,2)
);

CREATE TABLE control_al (
    usuario VARCHAR2(30),
    fecha DATE
);

CREATE OR REPLACE TRIGGER TR_INGRESOLIBROS
    BEFORE INSERT
    ON libros_al
BEGIN
    INSERT INTO control_al(usuario, fecha)
    VALUES(USER, SYSDATE);
END TR_INGRESOLIBROS;

INSERT INTO libros_al(codigo, titulo, autor, editorial, precio)
VALUES(1, 'El Quijote', 'Cervantes', 'Anaya', 25.50);

SELECT USUARIO,TO_CHAR(fecha, 'DD-MON-YYYY HH24:MI:SS') as fecha  FROM control_al;

SELECT * FROM CONTROL_AL;

SELECT * FROM libros_al;

DROP TABLE Empleados;

CREATE TABLE Empleados(
    documento CHAR(8),
    apellido VARCHAR2(30),
    nombre VARCHAR2(30),
    seccion VARCHAR2(20)
);

select * from CONTROL_AL;

TRUNCATE TABLE CONTROL_AL;

CREATE OR REPLACE TRIGGER TR_INGRESOEMPLEADOS
    BEFORE INSERT
    ON Empleados
    FOR EACH ROW
BEGIN
    INSERT INTO CONTROL_AL(usuario, fecha)
    VALUES(USER, SYSDATE);
END TR_INGRESOEMPLEADOS;


INSERT INTO Empleados(documento, apellido, nombre, seccion) VALUES('12345678', 'Perez', 'Juan', 'Ventas');
INSERT INTO Empleados(documento, apellido, nombre, seccion) VALUES('23456789', 'Gomez', 'Ana', 'Marketing');
INSERT INTO Empleados(documento, apellido, nombre, seccion) VALUES('34567890', 'Lopez', 'Carlos', 'Cocinero');
INSERT INTO Empleados(documento, apellido, nombre, seccion) VALUES('45678901', 'Martinez', 'Laura', 'Produccion');
INSERT INTO Empleados(documento, apellido, nombre, seccion) VALUES('56789012', 'Sanchez', 'Luis', 'Contaduria');
INSERT INTO Empleados(documento, apellido, nombre, seccion) VALUES('67890123', 'Diaz', 'Maria', 'Logistica');
INSERT INTO Empleados(documento, apellido, nombre, seccion) VALUES('78901234', 'Fernandez', 'Jose', 'Sistemas');

SELECT * FROM CONTROL_AL;
SELECT * FROM Empleados;

DROP TABLE alumnos;

CREATE TABLE alumnos(
    id_alumno VARCHAR2(10) NOT NULL,
    documento VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(30) NOT NULL,
    curso VARCHAR2(10) NOT NULL,
    materia VARCHAR2(15) NOT NULL,
    nota_final NUMBER NOT NULL
);

INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1001', '12345678', 'Juan Perez', 'A', 'Matematicas', 4.5);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1002', '23456789', 'Ana Gomez', 'B', 'Fisica', 3.8);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1003', '34567890', 'Carlos Lopez', 'A', 'Quimica', 4.2);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1004', '45678901', 'Laura Martinez', 'C', 'Historia', 4.0);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1005', '56789012', 'Luis Sanchez', 'B', 'Geografia', 3.9);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1006', '67890123', 'Maria Diaz', 'A', 'Biologia', 4.1);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1007', '78901234', 'Jose Fernandez', 'C', 'Ingles', 3.7);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1008', '89012345', 'Sofia Ramirez', 'B', 'Matematicas', 4.3);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1009', '90123456', 'Miguel Torres', 'A', 'Fisica', 3.6);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1010', '01234567', 'Lucia Morales', 'C', 'Quimica', 4.4);
INSERT INTO alumnos(id_alumno, documento, nombre, curso, materia, nota_final) VALUES('1011', '12345679', 'Pedro Alvarez', 'B', 'Historia', 3.5);

CREATE OR REPLACE TRIGGER TR_BORRADO_ALUMNOS
    BEFORE DELETE
    ON alumnos
    FOR EACH ROW
BEGIN   
    INSERT INTO CONTROL_AL(usuario, fecha)
    VALUES(USER, SYSDATE);
END TR_BORRADO_ALUMNOS;


SELECT * FROM CONTROL_AL;
SELECT * FROM alumnos;

DELETE FROM alumnos WHERE id_alumno = '1001';

DELETE FROM alumnos WHERE curso = 'A';

TRUNCATE TABLE CONTROL_AL;

DROP TABLE Empleados;

CREATE TABLE Empleados(
    documento CHAR(8),
    apellido VARCHAR2(30),
    nombre VARCHAR2(30),
    seccion VARCHAR2(20),
    sueldo NUMBER(8,2)
);

INSERT INTO Empleados(documento, apellido, nombre, seccion, sueldo) VALUES('12345678', 'Perez', 'Juan', 'Ventas', 500);
INSERT INTO Empleados(documento, apellido, nombre, seccion, sueldo) VALUES('23456789', 'Gomez', 'Ana', 'Marketing', 560);
INSERT INTO Empleados(documento, apellido, nombre, seccion, sueldo) VALUES('34567890', 'Lopez', 'Carlos', 'Cocinero', 680);
INSERT INTO Empleados(documento, apellido, nombre, seccion, sueldo) VALUES('45678901', 'Martinez', 'Laura', 'Produccion', 900);
INSERT INTO Empleados(documento, apellido, nombre, seccion, sueldo) VALUES('56789012', 'Sanchez', 'Luis', 'Contaduria', 1200);
INSERT INTO Empleados(documento, apellido, nombre, seccion, sueldo) VALUES('67890123', 'Diaz', 'Maria', 'Logistica', 1000);

CREATE OR REPLACE TRIGGER TR_ACTUALIZA
    BEFORE UPDATE 
    ON Empleados
    FOR EACH ROW
BEGIN
    INSERT INTO CONTROL_AL(usuario, fecha)
    VALUES(USER, SYSDATE);
END TR_ACTUALIZA;

UPDATE EMPLEADOS SET sueldo = sueldo-SUELDO*0.15 WHERE seccion = 'Contaduria';

SELECT * FROM CONTROL_AL;
SELECT * FROM Empleados;

CREATE TABLE control_empleados(
    usuario VARCHAR2(30),
    fecha DATE,
    accion VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER TR_ACTUALIZA
    BEFORE INSERT OR UPDATE OR DELETE
    ON Empleados
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO control_empleados(usuario, fecha, accion)
        VALUES(USER, SYSDATE, 'Ingreso');
    END IF;
    IF DELETING THEN
        INSERT INTO control_empleados(usuario, fecha, accion)
        VALUES(USER, SYSDATE, 'eliminacion');
    END IF;
    IF UPDATING THEN
        INSERT INTO control_empleados(usuario, fecha, accion)
        VALUES(USER, SYSDATE, 'actualizacion');
    END IF;
END TR_ACTUALIZA;

UPDATE EMPLEADOS SET seccion = 'RH' WHERE documento = '12345678';

SELECT * FROM control_empleados;
SELECT * FROM Empleados;

INSERT INTO EMPLEADOS VALUES('1111111', 'BANEGAS', 'ANGHELO', 'Sistemas', 2500);

DELETE FROM EMPLEADOS WHERE seccion = 'Sistemas';

DROP TABLE libros;
DROP TABLE ofertas;

CREATE TABLE libros(
    codigo NUMBER(6),
    titulo VARCHAR2(100),
    autor VARCHAR2(100),
    editorial VARCHAR2(100),
    precio NUMBER(6,2)
);

CREATE TABLE ofertas(
    codigo NUMBER(6),
    precio NUMBER(6,2),
    usuario VARCHAR2(20),
    fecha DATE
);

insert into libros
values(100,'Uno','Richard Bach','Planeta',25);
 
insert into libros
values(103,'El aleph','Borges','Emece',28);
 
insert into libros
values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 
insert into libros
values(120,'Aprenda PHP','Molina Mario','Nuevosiglo',55);
 
insert into libros
values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);

CREATE OR REPLACE TRIGGER TR_CONTROL_OFERTAS
    BEFORE INSERT 
    ON libros
    FOR EACH ROW
BEGIN
    if(:new.precio <= 30) then
        insert into ofertas
        values(:new.codigo, :new.precio, user, sysdate);
    end if;
END TR_CONTROL_OFERTAS;

SELECT * FROM libros;
SELECT * FROM ofertas;

insert into libros
values(100,'Uno','Richard Bach','Planeta',25);
 
insert into libros
values(103,'El aleph','Borges','Emece',28);
 
insert into libros
values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 
insert into libros
values(120,'Aprenda PHP','Molina Mario','Nuevosiglo',55);
 
insert into libros
values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);


CREATE OR REPLACE TRIGGER TR_ACTUALIZA_OFERTAS
    BEFORE UPDATE OF precio
    ON libros
    FOR EACH ROW
BEGIN
    IF(:OLD.precio > 30 AND :NEW.precio <= 30) THEN
        INSERT INTO ofertas
        VALUES(:NEW.codigo, :NEW.precio, USER, SYSDATE);
    END IF;
    IF(:OLD.precio <= 30 AND :NEW.precio > 30) THEN
        DELETE FROM ofertas
        WHERE codigo = :OLD.codigo;
    END IF;
END TR_ACTUALIZA_OFERTAS;

UPDATE libros SET precio = 100 WHERE codigo = 100;
UPDATE libros SET precio = 40 WHERE codigo = 100;


SELECT * FROM libros;
SELECT * FROM ofertas;


/* eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0MjQ3MDEyTHAiLCJjb2RpZ29TaXN0ZW1hIjoiN0M4QzU1MEJENjk5OTE2RTE3QzFENzYiLCJuaXQiOiJINHNJQUFBQUFBQUFBRE14TWpFM01EUXlNTFFBQURhWU8tWUtBQUFBIiwiaWQiOjY3MDYzMywiZXhwIjoxNzM4MzU1MzQ2LCJpYXQiOjE3MjYxMDA5MTYsIm5pdERlbGVnYWRvIjo0MjQ3MDEyMDE4LCJzdWJzaXN0ZW1hIjoiU0ZFIn0.TQciIISdMWT0uUeuowhq4PvrhBOcXiZ7_mzzdQvltjTaczb92imcIPrsIOr7_riCxMK1MMW3kbL3g23pgy-JUQ
 */


 drop table empleados;
 
 create table empleados(
  ci number,
apellido varchar2(20),
nombre varchar2(20),
  seccion varchar2(30),
sueldo number(8,2)
 );

 drop table control;
 
create table control(
usuario varchar2(30),
fecha date,
  ci number,
  antiguosueldo number(8,2),
  nuevosueldo number(8,2)
 );

 insert into empleados values(22333444,'Aguilar','Ana','Secretaria',500);
 
insert into empleados values(22555666,'Teran','Carlos','Contaduria',900);
 
insert into empleados values(22777888,'Zamora','Daniel','Secretaria',560);
 
insert into empleados values(22999000,'Siles','Federico','Sistemas',680);
 
insert into empleados values(23444555,'Menacho','Gabriela','Sistemas',1200);
 
insert into empleados values(23666777,'Medina','Juan','Contaduria',1000);
 
select * from empleados;
select* from control;

create or replace trigger tr_control_incremento
before update of sueldo
on empleados
for each row WHEN (new.sueldo > old.sueldo)
begin
insert into control
values(user,sysdate,:old.ci,:old.sueldo,:new.sueldo);
end tr_control_incremento;