CREATE OR REPLACE PROCEDURE mensaje IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola Mundo');
END mensaje;

EXECUTE mensaje;

BEGIN
    mensaje;
END;

CREATE TABLE libros (
    idLibro int not null primary key,
    titulo varchar2(100) not null,
    autor varchar2(100) not null,
    precio number(6,2) not null);

INSERT INTO libros VALUES(1, 'El señor de los anillos', 'J.R.R. Tolkien', 25.99);
INSERT INTO libros VALUES(2, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 19.99);
INSERT INTO libros VALUES(3, 'Cien años de soledad', 'Gabriel García Márquez', 22.50);
INSERT INTO libros VALUES(4, '1984', 'George Orwell', 18.99);
INSERT INTO libros VALUES(5, 'Orgullo y prejuicio', 'Jane Austen', 16.99);
INSERT INTO libros VALUES(6, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 21.75);
INSERT INTO libros VALUES(7, 'Matar a un ruiseñor', 'Harper Lee', 17.50);
INSERT INTO libros VALUES(8, 'Ulises', 'James Joyce', 20.25);
INSERT INTO libros VALUES(9, 'En busca del tiempo perdido', 'Marcel Proust', 23.99);
INSERT INTO libros VALUES(10, 'El gran Gatsby', 'F. Scott Fitzgerald', 19.50);
INSERT INTO libros VALUES(11, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', 16.75);
INSERT INTO libros VALUES(12, 'El principito', 'Antoine de Saint-Exupéry', 14.99);
INSERT INTO libros VALUES(13, 'Moby-Dick', 'Herman Melville', 18.50);
INSERT INTO libros VALUES(14, 'El retrato de Dorian Gray', 'Oscar Wilde', 15.25);
INSERT INTO libros VALUES(15, 'Los miserables', 'Victor Hugo', 21.99);
INSERT INTO libros VALUES(16, 'La Odisea', 'Homero', 17.99);
INSERT INTO libros VALUES(17, 'El gran diseño', 'Stephen Hawking', 20.50);
INSERT INTO libros VALUES(18, 'El alquimista', 'Paulo Coelho', 16.25);
INSERT INTO libros VALUES(19, 'El código Da Vinci', 'Dan Brown', 19.99);
INSERT INTO libros VALUES(20, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 22.75);

SELECT * from libros;

CREATE OR REPLACE PROCEDURE incrementa_precio AS
BEGIN 
    UPDATE LIBROS SET PRECIO=PRECIO+(PRECIO*0.1);
END;

BEGIN
    INCREMENTA_PRECIO;
END;

CREATE TABLE empleados(
documento char(8),
nombre varchar2(20),
apellido varchar2(20),
sueldo number(6,2),
fechaingreso date
);

--ingreso de datos
INSERT INTO empleados values('22222222','Juan','Perez',300,to_date('10/10/1998','dd/mm/yyyy'));
INSERT INTO empleados values('22333333','Luis','Lopez',300,to_date('12/05/2008','dd/mm/yyyy'));
INSERT INTO empleados values('22444444','Marta','Perez',500,to_date('25/08/2010','dd/mm/yyyy'));
INSERT INTO empleados values('22555555','Susana','Garcia',400,to_date('05/05/2012','dd/mm/yyyy'));
INSERT INTO empleados Values('22666666','Jose Maria','Morales',400,to_date('24/10/2005','dd/mm/yyyy'));

SELECT * FROM empleados;

CREATE OR REPLACE PROCEDURE incrementa_sueldo(
    anio IN NUMBER,
    porcetaje IN NUMBER)  
AS BEGIN
    UPDATE empleados SET SUELDO=SUELDO+(SUELDO*(porcetaje/100)) 
    WHERE (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM FECHAINGRESO)) > anio;
END incrementa_sueldo;

SELECT * FROM empleados;
EXECUTE incrementa_sueldo(15, 10);


CREATE OR REPLACE PROCEDURE ingreso_empleado(
    docu IN CHAR,
    nom IN VARCHAR2,
    ape IN VARCHAR2)  
AS BEGIN
    INSERT INTO empleados VALUES(docu, nom, ape, NULL, NULL);
END ingreso_empleado;

EXECUTE ingreso_empleado('22777777', 'Maria', 'Gomez');
EXECUTE ingreso_empleado('22888888', 'Carlos', 'Rodriguez');
EXECUTE ingreso_empleado('22999999', 'Ana', 'Martinez');

SELECT * FROM empleados;

CREATE OR REPLACE PROCEDURE eliminar_empleado(
    docu IN CHAR)
AS BEGIN
    DELETE FROM empleados WHERE documento = docu;
END eliminar_empleado;

EXECUTE eliminar_empleado('22777777');
EXECUTE eliminar_empleado('22888888');
EXECUTE eliminar_empleado('22999999');

SELECT * FROM empleados;

CREATE TABLE reporte(
    titulo VARCHAR2(40),
    precio NUMBER(6,2)
)

CREATE OR REPLACE PROCEDURE autorlibro(
    atitulo IN VARCHAR2)
AS 
v_autor VARCHAR2(50);
BEGIN
    SELECT autor INTO v_autor FROM libros WHERE titulo = atitulo;
    INSERT INTO reporte 
        SELECT atitulo, precio 
        FROM libros 
        WHERE autor = v_autor;
END autorlibro;

EXECUTE autorlibro('El alquimista');
EXECUTE autorlibro('Ulises');
EXECUTE autorlibro('Los miserables');

SELECT * FROM reporte;

SELECT * FROM libros;