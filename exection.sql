drop TABLE empleados 

create table empleados(
    ci number,
    apellido varchar2(20),
    nombre varchar2(20),
    seccion varchar2(30),
    sueldo number(8,2)
);

insert into empleados values(22333444,'Aguilar','Ana','Secretaria',500);
insert into empleados values(22555666,'Teran','Carlos','Contaduria',900);
insert into empleados values(22777888,'Zamora','Daniel','Secretaria',560);
insert into empleados values(22999000,'Siles','Federico','Sistemas',680);
insert into empleados values(23444555,'Menacho','Gabriela','Sistemas',1200);
insert into empleados values(23666777,'Medina','Juan','Contaduria',1000);

SELECT * FROM empleados;

DECLARE
    emp empleados%ROWTYPE;
BEGIN
    SELECT * INTO emp FROM empleados WHERE ci = 12345678;
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || emp.apellido);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || emp.nombre);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe el empleado con ci = 12345678');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Existe mas de un empleado con ci = 12345678');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error no controlado');
END;

/*
+ No data found
+ Too_many_rows
+ zero_divide
+ dup_val_on_index
*/

DECLARE
    emp empleados%ROWTYPE;
BEGIN
    SELECT * INTO emp FROM empleados WHERE ci > 1;
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || emp.apellido);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || emp.nombre);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe el empleado');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Existe mas de un empleado ');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error no controlado');
END;


DROP TABLE MASCOTA;

CREATE TABLE MASCOTA(
ID_MASCOTA INT PRIMARY KEY,
NOMBRE VARCHAR2(30)
);

INSERT INTO MASCOTA VALUES (1,'BOBBY');
INSERT INTO MASCOTA VALUES (2,'SPIKE');
INSERT INTO MASCOTA VALUES (3,'BOLT');

SELECT * FROM MASCOTA;

BEGIN
    INSERT INTO MASCOTA VALUES (1,'BOBBY');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Duplicado');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error no controlado');
END;

SELECT ci, sum(sueldo) FROM empleados;

declare
    mi_exception exception;
    pragma exception_init(mi_exception,-937);
    valor1 number;
    valor2 number;
begin
    select ci,sum(sueldo) into valor1,valor2 from empleados;
    dbms_output.put_line(valor1);
exception
    when mi_exception then
    dbms_output.put_line('FUNCIONDE GRUPO INCORRECTA');
    when others then
    dbms_output.put_line('ERROR INDEFINIDO');
end;

DECLARE
    emp empleados%ROWTYPE;
BEGIN
    SELECT * INTO emp FROM empleados WHERE ci > 1;
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || emp.sueldo);
EXCEPTION
    WHEN OTHERS THEN     
    dbms_output.put_line(sqlcode);
    dbms_output.put_line(sqlerrm);
END;

CREATE TABLE ERRORES(
    CODIGO NUMBER,
    MENSAJE VARCHAR2(100)
);


DECLARE
    emp empleados%ROWTYPE;
    codigo number;
    mensaje varchar2(100);
BEGIN
    SELECT * INTO emp FROM empleados;
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || emp.sueldo);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('codigo ' || sqlcode);
        DBMS_OUTPUT.PUT_LINE('mensaje ' || sqlerrm);
        codigo := SQLCODE;
        mensaje := SQLERRM;
        INSERT INTO ERRORES VALUES (codigo,mensaje);
END;

SELECT * FROM ERRORES;

drop table amigo;

create table amigo(
    id_persona int,
    nombre varchar2(25),
    edad int
);

insert into amigo values(1,'Jose',44);
insert into amigo values(2,'Luis',48);
insert into amigo values(3,'David',33);

select * from amigo;

declare
    valor NUMBER;
    nombreAmigo VARCHAR2(25);
    valorEdad NUMBER;
begin
    valor:=10;
    nombreAmigo:='Juan';
    valorEdad:=20;
    if valorEdad>120 then
-- LA EDAD NO PUEDES SER SUPERIOR A 120
-- codigo de raise debe estar entre 20000 y 20999
        raise_application_error(-20001,'LA EDAD NO PUEDE SER SUPERIOR A 120');  --genera un error
    else
        insert into amigo values(valor,nombreAmigo,valorEdad);
        commit;-- CONFIRMA LA TRANSACCION y rollback para deshacer
    end if;
end;

