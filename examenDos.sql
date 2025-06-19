CREATE OR REPLACE TYPE COMPUTADOR AS OBJECT (
    num_serie NUMBER,
    marca VARCHAR2(100),
    procesador VARCHAR2(100),
    sistema_operativo VARCHAR2(100),
    memoria VARCHAR2(100),
    MEMBER FUNCTION encender RETURN VARCHAR2,
    MEMBER FUNCTION ejecutar_programa(programa VARCHAR2) RETURN VARCHAR2,
    MEMBER FUNCTION apagar RETURN VARCHAR2,
    MEMBER FUNCTION mostrar RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY COMPUTADOR AS
    MEMBER FUNCTION encender RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Encendiendo ...';
    END encender;

    MEMBER FUNCTION ejecutar_programa(programa VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Ejecutando ' || programa || '  ...';
    END ejecutar_programa;

    MEMBER FUNCTION apagar RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Apagando ...';
    END apagar;

    MEMBER FUNCTION mostrar RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Número de serie: ' || num_serie || ', Marca: ' || marca || ', Procesador: ' || procesador || ', Sistema Operativo: ' || sistema_operativo || ', Memoria: ' || memoria;
    END mostrar;
END;

DECLARE
    pc COMPUTADOR;
BEGIN
    pc := COMPUTADOR(12345, 'HP', 'Raizen 5', 'Windows 11', '16GB');

    DBMS_OUTPUT.PUT_LINE(pc.encender());
    DBMS_OUTPUT.PUT_LINE(pc.ejecutar_programa('Word'));
    DBMS_OUTPUT.PUT_LINE(pc.mostrar());
    DBMS_OUTPUT.PUT_LINE(pc.apagar());
END;

drop TYPE PERSONA;
/*Ejerccio Dos */
CREATE OR REPLACE TYPE PERSONA AS OBJECT (
    ci NUMBER,
    nombre VARCHAR2(100),
    apellido VARCHAR2(100),
    fecha_nacimiento DATE,
    MEMBER FUNCTION mostrar_datos RETURN VARCHAR2
)NOT FINAL;

CREATE OR REPLACE TYPE BODY PERSONA AS
    MEMBER FUNCTION mostrar_datos RETURN VARCHAR2 IS
    BEGIN
        RETURN 'CI: ' || ci || ', Nombre: ' || nombre || ', Apellido: ' || apellido || ', Fecha de Nacimiento: ' || fecha_nacimiento;
    END mostrar_datos;
END;

DECLARE 
    p PERSONA := PERSONA(1234567, 'Anghelo', 'Banegas', '01/01/2000');
BEGIN
    DBMS_OUTPUT.PUT_LINE(p.mostrar_datos());
END;



CREATE OR REPLACE TYPE EMPLEADO UNDER PERSONA (
    sueldo NUMBER,
    email VARCHAR2(100),
    CONSTRUCTOR FUNCTION EMPLEADO(ci NUMBER, nombre VARCHAR2, apellido VARCHAR2, fecha_nacimiento DATE, sueldo NUMBER) RETURN SELF AS RESULT,
    MEMBER FUNCTION mostrar_datos_empleados RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY EMPLEADO AS
    CONSTRUCTOR FUNCTION EMPLEADO(ci NUMBER, nombre VARCHAR2, apellido VARCHAR2, fecha_nacimiento DATE, sueldo NUMBER) RETURN SELF AS RESULT IS
    BEGIN
        SELF.ci := ci;
        SELF.nombre := nombre;
        SELF.apellido := apellido;
        SELF.fecha_nacimiento := fecha_nacimiento;
        SELF.sueldo := sueldo;
        SELF.email := UPPER(SUBSTR(nombre,1,1)) || ci || UPPER(SUBSTR(apellido,1,3)) || '@empresa.com';
        RETURN;
    END;

    MEMBER FUNCTION mostrar_datos_empleados RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.mostrar_datos() || ', Sueldo: ' || sueldo || ', Email: ' || email;
    END mostrar_datos_empleados;
END;

DECLARE
    emp EMPLEADO  := EMPLEADO(1234567, 'Anghelo', 'Banegas', '01/01/2000', 1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE(emp.mostrar_datos_empleados());
END;


CREATE OR REPLACE TYPE JUGADOR UNDER PERSONA (
    fecha_ingreso VARCHAR2(100),
    salario NUMBER,
    CONSTRUCTOR FUNCTION JUGADOR(ci NUMBER, nombre VARCHAR2, apellido VARCHAR2, fecha_nacimiento DATE, fecha_ingreso DATE) RETURN SELF AS RESULT,
    MEMBER FUNCTION mostrar_datos_jugador RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY JUGADOR AS
    CONSTRUCTOR FUNCTION JUGADOR(ci NUMBER, nombre VARCHAR2, apellido VARCHAR2, fecha_nacimiento DATE, fecha_ingreso DATE) RETURN SELF AS RESULT IS
    BEGIN
        SELF.ci := ci;
        SELF.nombre := nombre;
        SELF.apellido := apellido;
        SELF.fecha_nacimiento := fecha_nacimiento;
        SELF.fecha_ingreso := fecha_ingreso;
        IF  (EXTRACT(YEAR from SYSDATE)-EXTRACT(YEAR FROM fecha_ingreso))>2 THEN
            SELF.salario := 1200 * (EXTRACT(YEAR from SYSDATE)-EXTRACT(YEAR FROM fecha_ingreso));
        ELSE
            SELF.salario := 1000;
        END IF;
        RETURN;
    END;

    MEMBER FUNCTION mostrar_datos_jugador RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.mostrar_datos() || ', Fecha de Ingreso: ' || fecha_ingreso || ', Salario: ' || salario;
    END mostrar_datos_jugador;
END;

DECLARE
    jug JUGADOR := JUGADOR(1234567, 'Anghelo', 'Banegas', '01/01/2000', '01/01/2019');
BEGIN
    DBMS_OUTPUT.PUT_LINE(jug.mostrar_datos_jugador());
END;
    


CREATE OR REPLACE TYPE PASAJERO AS OBJECT (
    ci NUMBER,
    nombre VARCHAR2(100),
    MEMBER FUNCTION mostrar_datos RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY PASAJERO AS
    MEMBER FUNCTION mostrar_datos RETURN VARCHAR2 IS
    BEGIN
        RETURN 'CI: ' || ci || ', Nombre: ' || nombre;
    END mostrar_datos;
END;

CREATE TABLE VUELO (
    id NUMBER ,
    origen VARCHAR2(100),
    destino VARCHAR2(100),
    pasajero PASAJERO
);

INSERT INTO VUELO VALUES (1, 'La Paz', 'Santa Cruz', PASAJERO(1234567, 'Anghelo'));
INSERT INTO VUELO VALUES (2, 'Santa Cruz', 'La Paz', PASAJERO(7654321, 'Denilson'));

DROP TABLE VUELO;

SELECT L.id,L.origen,L.destino,L.pasajero.mostrar_datos()
FROM VUELO L;