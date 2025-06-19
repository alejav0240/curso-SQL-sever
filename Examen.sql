/*
1.	(30%) Crear el objeto persona con los siguientes atributos 
CI, Paterno, Materno, Nombres, Fecha Nacimiento
Los métodos son: mostrar_datos, mostrar_edad
mostrar_datos: Debe mostrar los datos de la persona
mostrar_edad: Debe mostrar la edad de la persona
Este objeto debe ser heredable. 
DESPUÉS DE CREAR EL OBJETO DEBE INSTANCIARLO Y PROBAR SUS MÉTODOS*/
CREATE OR REPLACE TYPE PERSONA_CRA AS OBJECT (
    ci NUMBER,
    paterno VARCHAR2(100),
    materno VARCHAR2(100),
    nombres VARCHAR2(100),
    fecha_nacimiento DATE,
    MEMBER FUNCTION mostrar_datos RETURN VARCHAR2,
    MEMBER FUNCTION mostrar_edad RETURN NUMBER
)NOT FINAL;

CREATE OR REPLACE TYPE BODY PERSONA_CRA AS
    MEMBER FUNCTION mostrar_datos RETURN VARCHAR2 IS
    BEGIN
        RETURN 'CI: '||ci||' Paterno: '||paterno||' Materno: '||materno||' Nombres: '||nombres||' Fecha Nacimiento: '||fecha_nacimiento;
    END mostrar_datos;
    MEMBER FUNCTION mostrar_edad RETURN NUMBER IS
    BEGIN
        RETURN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fecha_nacimiento);
    END mostrar_edad;
END;


DECLARE
    persona PERSONA_CRA;
BEGIN
    persona := PERSONA_CRA(1234567, 'Banegas', 'Martinez', 'Anghelo', '01/01/2000');
    DBMS_OUTPUT.PUT_LINE(persona.mostrar_datos);
    DBMS_OUTPUT.PUT_LINE('Edad: '||persona.mostrar_edad);
END;


/*
2. (40%) Crear dos objetos (hijos) que hereden las características del objeto persona 
Los objetos son: docente y estudiante
•	Docente tendrá los atributos especialidad y email
•	Estudiante tendrá los atributos carrera y matricula*/

/*
En los body de los objetos docente y estudiante realizar:
•	(docente) 
o	Un método para mostrar los datos del docente: mostrar_datos_docente
o	Un constructor que además de ingresar los datos del docente, genere el correo institucional del docente bajo el siguiente criterio, inicial nombre,paterno,inicial materno @univalle.edu.  
Ej. Paredes Mendoza Cristian  entonces su email será cparedesm@univalle.edu
DESPUÉS DE CREAR EL OBJETO DEBE INSTANCIARLO Y PROBAR SUS MÉTODOS
*/

CREATE OR REPLACE TYPE DOCENTE_CRA UNDER PERSONA_CRA (
    especialidad VARCHAR2(100),
    email VARCHAR2(100),
    MEMBER FUNCTION mostrar_datos_docente RETURN VARCHAR2,
    CONSTRUCTOR FUNCTION DOCENTE_CRA(
        ci NUMBER, 
        paterno VARCHAR2, 
        materno VARCHAR2, 
        nombres VARCHAR2, 
        fecha_nacimiento DATE, 
        especialidad VARCHAR2
    ) RETURN SELF AS RESULT
);

CREATE OR REPLACE TYPE BODY DOCENTE_CRA AS

    CONSTRUCTOR FUNCTION DOCENTE_CRA(
        ci NUMBER, 
        paterno VARCHAR2, 
        materno VARCHAR2, 
        nombres VARCHAR2, 
        fecha_nacimiento DATE, 
        especialidad VARCHAR2) 
    RETURN SELF AS RESULT IS
    BEGIN
        SELF.ci := ci;
        SELF.paterno := paterno;
        SELF.materno := materno;
        SELF.nombres := nombres;
        SELF.fecha_nacimiento := fecha_nacimiento;
        SELF.especialidad := especialidad;
        SELF.email := INITCAP(SUBSTR(nombres, 1, 1))||UPPER(paterno)||INITCAP(SUBSTR(materno, 1, 1))||'@univalle.edu';
        RETURN;
    END;

    MEMBER FUNCTION mostrar_datos_docente RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.mostrar_datos()||' Especialidad: '||especialidad||' Email: '||email;
    END mostrar_datos_docente;    
END;

DECLARE
    docente DOCENTE_CRA;
BEGIN
    docente := DOCENTE_CRA(1234567, 'Paredes', 'Mendoza', 'Cristian', '01/01/2000', 'Ingenieria de Sistemas');
    DBMS_OUTPUT.PUT_LINE(docente.mostrar_datos_docente);
END;

/*
•	(estudiante) 
o	Un método para mostrar los datos del estudiante: mostrar_datos_estudiante
o	Un constructor que además de ingresar los datos del estudiante, genere la matricula del estudiante bajo el siguiente criterio, Inicial paterno, inicial materno, inicial nombre y año de fecha de nacimiento
Ej. Gutierrez Cespedes Tatiana  23/05/2002 entonces su matricula será GCT2002
DESPUÉS DE CREAR EL OBJETO DEBE INSTANCIARLO Y PROBAR SUS MÉTODOS
*/

CREATE OR REPLACE TYPE ESTUDIANTE_CRA UNDER PERSONA_CRA (
    carrera VARCHAR2(100),
    matricula VARCHAR2(100),
    MEMBER FUNCTION mostrar_datos_estudiante RETURN VARCHAR2,
    CONSTRUCTOR FUNCTION ESTUDIANTE_CRA(
        ci NUMBER, 
        paterno VARCHAR2, 
        materno VARCHAR2, 
        nombres VARCHAR2, 
        fecha_nacimiento DATE, 
        carrera VARCHAR2
    ) RETURN SELF AS RESULT
);

CREATE OR REPLACE TYPE BODY ESTUDIANTE_CRA AS

    CONSTRUCTOR FUNCTION ESTUDIANTE_CRA(
        ci NUMBER, 
        paterno VARCHAR2, 
        materno VARCHAR2, 
        nombres VARCHAR2, 
        fecha_nacimiento DATE, 
        carrera VARCHAR2) 
    RETURN SELF AS RESULT IS
    BEGIN
        SELF.ci := ci;
        SELF.paterno := paterno;
        SELF.materno := materno;
        SELF.nombres := nombres;
        SELF.fecha_nacimiento := fecha_nacimiento;
        SELF.carrera := carrera;
        SELF.matricula := UPPER(SUBSTR(paterno, 1, 1))||UPPER(SUBSTR(materno, 1, 1))||UPPER(SUBSTR(nombres, 1, 1))||EXTRACT(YEAR FROM fecha_nacimiento);
        RETURN;
    END;

    MEMBER FUNCTION mostrar_datos_estudiante RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.mostrar_datos()||' Carrera: '||carrera||' Matricula: '||matricula;
    END mostrar_datos_estudiante;    
END;

DECLARE
    estudiante ESTUDIANTE_CRA;
BEGIN
    estudiante := ESTUDIANTE_CRA(1234567, 'Gutierrez', 'Cespedes', 'Tatiana', '23/05/2002', 'Ingenieria de Sistemas');
    DBMS_OUTPUT.PUT_LINE(estudiante.mostrar_datos_estudiante);
END;

/*3. (30%) Crear una tabla ESTUDIANTE con atributos como ser sus datos personales (mínimo cinco atributos) el sexto atributo será un atributo de tipo objeto. 
El objeto será CASILLERO, defina tres atributos como mínimo y dos métodos como mínimo
•	Realizar la adición (INSERT) de cinco registros
•	Realizar una actualización UPDATE, con el criterio que considere necesario
•	Muestre los registros de la tabla (SELECT) utilizando los atributos y métodos del objeto*/
DROP TYPE CASILLERO_CRA;
-- Definición del tipo
CREATE OR REPLACE TYPE CASILLERO_CRA AS OBJECT (
    numero NUMBER,
    ubicacion VARCHAR2(100),
    color VARCHAR2(50),
    MEMBER FUNCTION mostrar_casillero RETURN VARCHAR2,
    MEMBER PROCEDURE cambiar_color(color VARCHAR2) 
);

-- Cuerpo del tipo
CREATE OR REPLACE TYPE BODY CASILLERO_CRA AS
    MEMBER FUNCTION mostrar_casillero RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Numero: '||SELF.numero||' Ubicacion: '||SELF.ubicacion||' Color: '||SELF.color;
    END mostrar_casillero;

    MEMBER PROCEDURE cambiar_color(color VARCHAR2) IS 
    BEGIN
        SELF.color := color; 
    END cambiar_color;
END;

CREATE TABLE ESTUDIANTES_CRA (
    ci NUMBER,
    paterno VARCHAR2(100),
    materno VARCHAR2(100),
    nombres VARCHAR2(100),
    fecha_nacimiento DATE,
    carrera VARCHAR2(100),
    casillero CASILLERO_CRA
);

INSERT INTO ESTUDIANTES_CRA VALUES(1234567, 'Gutierrez', 'Cespedes', 'Tatiana', '23/05/2002', 'Ingenieria de Sistemas', CASILLERO_CRA(1, 'Pabellon A', 'Rojo'));
INSERT INTO ESTUDIANTES_CRA VALUES(1234568, 'Lopez', 'Perez', 'Juan', '23/05/2002', 'Ingenieria de Sistemas', CASILLERO_CRA(2, 'Pabellon B', 'Azul'));
INSERT INTO ESTUDIANTES_CRA VALUES(1234569, 'Gonzalez', 'Rodriguez', 'Maria', '23/05/2002', 'Ingenieria de Sistemas', CASILLERO_CRA(3, 'Pabellon C', 'Verde'));
INSERT INTO ESTUDIANTES_CRA VALUES(1234570, 'Martinez', 'Sanchez', 'Pedro', '23/05/2002', 'Ingenieria de Sistemas', CASILLERO_CRA(4, 'Pabellon D', 'Amarillo'));
INSERT INTO ESTUDIANTES_CRA VALUES(1234571, 'Hernandez', 'Lopez', 'Laura', '23/05/2002', 'Ingenieria de Sistemas', CASILLERO_CRA(5, 'Pabellon E', 'Blanco'));


UPDATE ESTUDIANTES_CRA est SET est.casillero.color='Blanco' WHERE CARRERA = 'Ingenieria de Sistemas';

SELECT est.* FROM ESTUDIANTES_CRA est;


/*
INSTRUCCIONES
•	LOS OBJETOS CREADOS Y TABLAS DEBEN TENER SUS INICIALES, PATERNO MATERNO Y NOMBRE. EJ PERSONARDL
•	DESPUÉS DE CADA PREGUNTA DEBE COPIAR EL SCRIPT PL/SQL
•	REALIZAR UNA CAPTURA DE PANTALLA DEL SCRIPT
•	REALIZAR UNA CAPTURA DE PANTALLA DEL RESULTADO OBTENIDO

*/