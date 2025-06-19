CREATE OR REPLACE TYPE empleado AS OBJECT(
    -- Atributos
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    edad NUMBER,
    -- Métodos
    MEMBER FUNCTION ver_nombre RETURN VARCHAR2,
    MEMBER FUNCTION ver_apellido RETURN VARCHAR2,
    MEMBER FUNCTION ver_edad RETURN NUMBER 
);

-- Implementación de los métodos
CREATE OR REPLACE TYPE BODY empleado AS
    MEMBER FUNCTION ver_nombre RETURN VARCHAR2 IS
    BEGIN
        RETURN nombre;
    END ver_nombre;

    MEMBER FUNCTION ver_apellido RETURN VARCHAR2 IS
    BEGIN
        RETURN apellido;
    END ver_apellido;

    MEMBER FUNCTION ver_edad RETURN NUMBER IS
    BEGIN
        RETURN edad;
    END ver_edad;
END;

DECLARE
    -- Declaración de un objeto de tipo empleado
    -- Instanciación del objeto
    v1 empleado := empleado('Juan', 'Pérez', 30);
BEGIN
    -- Llamada a los métodos
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v1.ver_nombre());
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || v1.ver_apellido());
    DBMS_OUTPUT.PUT_LINE('Edad: ' || v1.ver_edad());
END;

CREATE OR REPLACE TYPE producto AS OBJECT(
    -- Atributos
    codigo NUMBER,
    nombre VARCHAR2(20),
    precio NUMBER,
    -- Métodos
    MEMBER FUNCTION ver_producto RETURN VARCHAR2,
    MEMBER FUNCTION ver_precio RETURN NUMBER,
    MEMBER PROCEDURE cambiar_precio(nuevo_precio NUMBER)
);

-- Implementación de los métodos
create or replace TYPE BODY producto AS
    MEMBER FUNCTION ver_producto RETURN VARCHAR2 IS
    BEGIN
        RETURN 'codigo: '||codigo||' nombre: '||nombre||' precio: '||precio;
    END ver_producto;

    MEMBER FUNCTION ver_precio RETURN NUMBER IS
    BEGIN
        RETURN precio;
    END ver_precio;

    MEMBER PROCEDURE cambiar_precio(nuevo_precio NUMBER) IS
    BEGIN
        precio := nuevo_precio;
    END cambiar_precio;
END;

DECLARE
    -- Declaración de un objeto de tipo producto
    valor1 producto ;
BEGIN
    -- Instanciación del objeto
    valor1 := producto(111, 'Disco Duro', 345);
    -- Llamada a los métodos
    DBMS_OUTPUT.PUT_LINE(valor1.ver_producto);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || valor1.ver_precio());
    valor1.cambiar_precio(777);
    DBMS_OUTPUT.PUT_LINE('Nuevo precio: ' || valor1.ver_precio());
END;

--eliminacion de los objetos producto 
DROP TYPE producto;

DECLARE 
    prop1 producto;
BEGIN
    prop1 := producto(200, 'Pantalla', 175);
    DBMS_OUTPUT.PUT_LINE(prop1.ver_producto);
    prop1.nombre := 'Monitor';
    DBMS_OUTPUT.PUT_LINE(prop1.ver_producto);
END;

-- metodo self 
create or replace TYPE BODY producto AS
    MEMBER FUNCTION ver_producto RETURN VARCHAR2 IS
    BEGIN
        RETURN 'codigo: '||codigo||' nombre: '||nombre||' precio: '||precio;
    END ver_producto;

    MEMBER FUNCTION ver_precio RETURN NUMBER IS
    BEGIN
        RETURN precio;
    END ver_precio;

    MEMBER PROCEDURE cambiar_precio(precio NUMBER) IS
    BEGIN
        SELF.precio := precio;--self hace referencia al objeto igual al this en java
    END cambiar_precio;
END;

-- metodo estático
CREATE OR REPLACE TYPE producto AS OBJECT(
    -- Atributos
    codigo NUMBER,
    nombre VARCHAR2(20),
    precio NUMBER,
    -- Métodos
    MEMBER FUNCTION ver_producto RETURN VARCHAR2,
    MEMBER FUNCTION ver_precio RETURN NUMBER,
    STATIC FUNCTION obtener_producto(codigo NUMBER) RETURN producto-- metodo estatico trabaja con la clase no con el objeto
);


CREATE TABLE  auditoria(
    usuario VARCHAR2(100),
    fecha DATE
);

SELECT * FROM auditoria;

create or replace TYPE BODY producto AS
    MEMBER FUNCTION ver_producto RETURN VARCHAR2 IS
    BEGIN
        RETURN 'codigo: '||codigo||' nombre: '||nombre||' precio: '||precio;
    END ver_producto;

    MEMBER FUNCTION ver_precio RETURN NUMBER IS
    BEGIN
        RETURN precio;
    END ver_precio;

    MEMBER PROCEDURE cambiar_precio(precio NUMBER) IS
    BEGIN
        SELF.precio := precio;--self hace referencia al objeto igual al this en java
    END cambiar_precio;

    STATIC PROCEDURE auditoria AS
    BEGIN
        INSERT INTO auditoria VALUES(USER, SYSDATE);
    END auditoria;
END;

BEGIN
    producto.auditoria;
END;

-- Recompilar el tipo
ALTER TYPE SYSTEM.PRODUCTO COMPILE;

-- Recompilar el cuerpo del tipo
ALTER TYPE SYSTEM.PRODUCTO COMPILE BODY;

CREATE OR REPLACE TYPE producto AS OBJECT (
    codigo NUMBER,
    nombre VARCHAR2(100),
    precio NUMBER,
    MEMBER FUNCTION ver_producto RETURN VARCHAR2,
    MEMBER FUNCTION ver_precio RETURN NUMBER,
    MEMBER PROCEDURE cambiar_precio(precio NUMBER),
    STATIC PROCEDURE auditoria,
    CONSTRUCTOR FUNCTION producto(codigo NUMBER, nombre VARCHAR2) RETURN SELF AS RESULT
);

CREATE OR REPLACE TYPE BODY producto AS
    MEMBER FUNCTION ver_producto RETURN VARCHAR2 IS
    BEGIN
        RETURN 'codigo: '||SELF.codigo||' nombre: '||SELF.nombre||' precio: '||SELF.precio;
    END ver_producto;

    MEMBER FUNCTION ver_precio RETURN NUMBER IS
    BEGIN
        RETURN SELF.precio;
    END ver_precio;

    MEMBER PROCEDURE cambiar_precio(precio NUMBER) IS
    BEGIN
        SELF.precio := precio; -- self hace referencia al objeto igual al this en java
    END cambiar_precio;

    STATIC PROCEDURE auditoria IS
    BEGIN
        INSERT INTO auditoria VALUES(USER, SYSDATE);
    END auditoria;

    CONSTRUCTOR FUNCTION producto(codigo NUMBER, nombre VARCHAR2) RETURN SELF AS RESULT IS
    BEGIN
        SELF.codigo := codigo;
        SELF.nombre := nombre;
        SELF.precio := NULL;
        RETURN; -- Corrección aquí
    END producto;
END;

DECLARE
    p1 producto;
BEGIN
    p1 := producto(300, 'Scanner');
    DBMS_OUTPUT.PUT_LINE(p1.ver_producto);
    p1.nombre := 'Monitor';
    DBMS_OUTPUT.PUT_LINE(p1.ver_producto);
END;

--*  sobrecarga de metodos 
CREATE OR REPLACE TYPE producto AS OBJECT (
    codigo NUMBER,
    nombre VARCHAR2(100),
    precio NUMBER,
    MEMBER FUNCTION ver_producto RETURN VARCHAR2,
    MEMBER FUNCTION ver_precio RETURN NUMBER,
    MEMBER FUNCTION ver_precio (impuesto NUMBER) RETURN NUMBER,
    MEMBER PROCEDURE cambiar_precio(precio NUMBER),
    STATIC PROCEDURE auditoria,
    CONSTRUCTOR FUNCTION producto(codigo NUMBER, nombre VARCHAR2) RETURN SELF AS RESULT
);

CREATE OR REPLACE TYPE BODY producto AS
    MEMBER FUNCTION ver_producto RETURN VARCHAR2 IS
    BEGIN
        RETURN 'codigo: '||SELF.codigo||' nombre: '||SELF.nombre||' precio: '||SELF.precio;
    END ver_producto;

    MEMBER FUNCTION ver_precio RETURN NUMBER IS
    BEGIN
        RETURN SELF.precio;
    END ver_precio;

    -- Sobrecarga de métodos
    MEMBER FUNCTION ver_precio (impuesto NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN SELF.precio + (SELF.precio * impuesto / 100);
    END ver_precio;

    MEMBER PROCEDURE cambiar_precio(precio NUMBER) IS
    BEGIN
        SELF.precio := precio; -- self hace referencia al objeto igual al this en java
    END cambiar_precio;

    STATIC PROCEDURE auditoria IS
    BEGIN
        INSERT INTO auditoria VALUES(USER, SYSDATE);
    END auditoria;

    CONSTRUCTOR FUNCTION producto(codigo NUMBER, nombre VARCHAR2) RETURN SELF AS RESULT IS
    BEGIN
        SELF.codigo := codigo;
        SELF.nombre := nombre;
        SELF.precio := NULL;
        RETURN; 
    END producto;
END;

DECLARE
    prod2 producto:= producto(700, 'Impresora', 450);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Precio sin impuesto: ' || prod2.ver_precio());
    DBMS_OUTPUT.PUT_LINE('Precio con impuesto: ' || prod2.ver_precio(10));
END;

--* Herencia de objetos
        --! Under Hereda
        --! Not Final puede heredar

CREATE OR REPLACE TYPE producto AS OBJECT (
    codigo NUMBER,
    nombre VARCHAR2(100),
    precio NUMBER,
    MEMBER FUNCTION ver_producto RETURN VARCHAR2,
    MEMBER FUNCTION ver_precio RETURN NUMBER,
    MEMBER FUNCTION ver_precio (impuesto NUMBER) RETURN NUMBER,
    MEMBER PROCEDURE cambiar_precio(precio NUMBER),
    STATIC PROCEDURE auditoria,
    CONSTRUCTOR FUNCTION producto(codigo NUMBER, nombre VARCHAR2) RETURN SELF AS RESULT
)NOT FINAL;

CREATE OR REPLACE TYPE BODY producto AS
    MEMBER FUNCTION ver_producto RETURN VARCHAR2 IS
    BEGIN
        RETURN 'codigo: '||SELF.codigo||' nombre: '||SELF.nombre||' precio: '||SELF.precio;
    END ver_producto;

    MEMBER FUNCTION ver_precio RETURN NUMBER IS
    BEGIN
        RETURN SELF.precio;
    END ver_precio;

    -- Sobrecarga de métodos
    MEMBER FUNCTION ver_precio (impuesto NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN SELF.precio + (SELF.precio * impuesto / 100);
    END ver_precio;

    MEMBER PROCEDURE cambiar_precio(precio NUMBER) IS
    BEGIN
        SELF.precio := precio; -- self hace referencia al objeto igual al this en java
    END cambiar_precio;

    STATIC PROCEDURE auditoria IS
    BEGIN
        INSERT INTO auditoria VALUES(USER, SYSDATE);
    END auditoria;

    CONSTRUCTOR FUNCTION producto(codigo NUMBER, nombre VARCHAR2) RETURN SELF AS RESULT IS
    BEGIN
        SELF.codigo := codigo;
        SELF.nombre := nombre;
        SELF.precio := NULL;
        RETURN; 
    END producto;
END;

--* Herencia de objetos objeto hijo
CREATE OR REPLACE TYPE producto_licencia UNDER producto(
    fecha_vencimiento DATE,
    MEMBER FUNCTION ver_vencimiento RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY producto_licencia AS
    MEMBER FUNCTION ver_vencimiento RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Fecha de vencimiento: ' || fecha_vencimiento;
    END ver_vencimiento;
END;

DECLARE 
    prod5 producto_licencia := producto_licencia(800, 'Antivirus', 150, SYSDATE);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Precio: '||prod5.ver_precio);
    DBMS_OUTPUT.PUT_LINE('Precio con impuesto: '||prod5.ver_precio(35));
    DBMS_OUTPUT.PUT_LINE('Precio: '||prod5.ver_producto);
    DBMS_OUTPUT.PUT_LINE('Fecha de Vencimiento: '||prod5.ver_vencimiento);

END;
