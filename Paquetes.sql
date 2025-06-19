-- son un grupo logico de objetos de la dase de datos 
-- que se pueden crear, modificar y eliminar en conjunto]
-- se compne de una especificacion y un cuerpo
-- la especificacion se configura de manera obligatoria
-- se coloca que cosas se van a crear * es donde se declara *
-- el cuerpo es opcional
-- se coloca como se van a crear las cosas * es donde se implementa *
-- se pueden crear paquetes de dos formas
-- 1. paquetes de especificacion
-- 2. paquetes de especificacion y cuerpo
-- los paquetes de especificacion son aquellos que solo tienen la especificacion
-- los paquetes de especificacion y cuerpo son aquellos que tienen la especificacion y el cuerpo
-- los paquetes de especificacion y cuerpo son los mas comunes
-- los paquetes de especificacion son utilizados cuando se quiere ocultar la implementacion
-- de los objetos que se encuentran en el cuerpo
-- los paquetes de especificacion y cuerpo son utilizados cuando se quiere mostrar la implementacion
-- de los objetos que se encuentran en el cuerpo
-- los paquetes de especificacion y cuerpo son los mas comunes
drop table productosPL;

create table productosPL (
codigo int not null primary key,
nombre varchar2(100) not null,
precio number(6,2) not null,
codigo_fabricante int not null);

insert into productosPL values(1, 'Disco duro SATA· 1TB', 86.99, 5);
insert into productosPL values(2 , 'Memoria RAM DDR4 8GB', 120, 6);
insert into productosPL values(3, 'DISCO SSD 1 TB', 150.99, 4);
insert into productosPL values(4, 'GEFORCE GTX 1050Ti', 185, 7);
insert into productosPL values(5, 'GEFORCE GTX 1080TI', 755, 6);
insert into productosPL values(6, 'Monitor 24 LED Full HD', 202, 1);
insert into productosPL values(7, 'Monitor 27 LED Full HD', 245.99, 1);
insert into productosPL values(8, 'Portátil Yoga 520', 559, 2);
insert into productosPL values(9, 'Portátil Ideapd 320', 444, 2);
insert into productosPL values(10, 'Impresora HP Deskjet 3720', 59.99, 3);
insert into productosPL values(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT * FROM productosPL;

-- paquete de especificacion
CREATE OR REPLACE PACKAGE gestion_productos AS
    PROCEDURE caracteristicas(v_codigo productosPL.codigo%TYPE);
END gestion_productos;

CREATE OR REPLACE PACKAGE BODY gestion_productos AS
    PROCEDURE caracteristicas(v_codigo productosPL.codigo%TYPE) IS
    v_producto productosPL.NOMBRE%TYPE;
    v_precio productosPL.PRECIO%TYPE;
    BEGIN
        SELECT nombre,precio INTO v_producto, v_precio
        FROM productosPL WHERE codigo = v_codigo;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio);
    END caracteristicas;
END gestion_productos;

CREATE OR REPLACE PACKAGE gestion_productos AS
    PROCEDURE caracteristicas(v_codigo productosPL.codigo%TYPE);

    FUNCTION f_precio(v_codigo int)
    RETURN NUMBER;

    PROCEDURE aumentar_precio(v_codigo int, v_precio int);

END gestion_productos;

CREATE OR REPLACE PACKAGE BODY gestion_productos AS
    PROCEDURE caracteristicas(v_codigo productosPL.codigo%TYPE) IS
        v_producto productosPL.NOMBRE%TYPE;
        v_precio productosPL.PRECIO%TYPE;
        BEGIN
            SELECT nombre,precio INTO v_producto, v_precio
            FROM productosPL WHERE codigo = v_codigo;
            DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto);
            DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio);
    END caracteristicas;

    FUNCTION f_precio(v_codigo int) RETURN NUMBER IS
        v_precio NUMBER;
        BEGIN
            SELECT precio INTO v_precio
            FROM productosPL WHERE codigo = v_codigo;
            RETURN v_precio;
    END f_precio;

    PROCEDURE aumentar_precio(v_codigo int, v_precio int) IS
        v_producto productosPL%ROWTYPE;
        BEGIN            
            SELECT * INTO v_producto
            FROM productosPL WHERE codigo = v_codigo;
            
            DBMS_OUTPUT.PUT_LINE('-------Valores Antiguos---------');
            DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
            DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio);

            UPDATE productosPL
            SET precio =  v_precio
            WHERE codigo = v_codigo;

            
            SELECT * INTO v_producto
            FROM productosPL WHERE codigo = v_codigo;

            DBMS_OUTPUT.PUT_LINE('-------Valores Nuevos---------');
            DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
            DBMS_OUTPUT.PUT_LINE('Nuevo Precio: ' || v_producto.precio);
    END aumentar_precio;

END gestion_productos;

SELECT * FROM productosPL;

BEGIN
    gestion_productos.caracteristicas(7);
END;

SELECT GESTION_PRODUCTOS.F_PRECIO(7) precio FROM DUAL;

SELECT * FROM productosPL;

BEGIN 
    gestion_productos.aumentar_precio(2, 500);
END;