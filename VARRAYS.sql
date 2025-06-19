DECLARE
    TYPE a_ciudades IS VARRAY(5) OF VARCHAR2(20);
    nombre a_ciudades;
BEGIN
    nombre := a_ciudades('La Paz', 'Tarija', 'Sucre', 'Oruro', 'Trinidad');
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('La ciudad es : '||nombre(i));
    END LOOP;
END;

DECLARE
    TYPE matriz_nombres IS VARRAY(5) OF VARCHAR2(20);
    TYPE matriz_edad IS VARRAY(5) OF INTEGER;
    nombres matriz_nombres;
    edad matriz_edad;
    total INTEGER;
BEGIN
    nombres := matriz_nombres('Juan', 'Pedro', 'Maria', 'Jose', 'Carlos');
    edad := matriz_edad(20, 30, 40, 50, 60);
    total := nombres.COUNT;
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('El nombre es : '||nombres(i)||' y la edad es : '||edad(i));
    END LOOP;
END;

drop TABLE productosPL;

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


DECLARE 
    v_nombre productosPL.nombre%TYPE;
    v_precio productosPL.precio%TYPE;
BEGIN
    SELECT nombre, precio INTO v_nombre, v_precio
    FROM productosPL
    WHERE codigo = &cod;
    DBMS_OUTPUT.PUT_LINE('El nombre del producto es : '||v_nombre||' y su precio es : '||v_precio);
END;

DECLARE 
    reg_productos productosPL%ROWTYPE;
BEGIN
    SELECT * INTO reg_productos
    FROM productosPL
    WHERE codigo = &cod;
    DBMS_OUTPUT.PUT_LINE('CARACTERISTICAS DEL PRODUCTO');
    DBMS_OUTPUT.PUT_LINE('El id del producto es : '||reg_productos.codigo);
    DBMS_OUTPUT.PUT_LINE('El nombre del producto es : '||reg_productos.nombre);
    DBMS_OUTPUT.PUT_LINE('El precio del producto es : '||reg_productos.precio);
    DBMS_OUTPUT.PUT_LINE('El codigo del fabricante es : '||reg_productos.codigo_fabricante);
END;


