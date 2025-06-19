    
drop table empleados;

create table empleados(
    documento char(8),
    apellido varchar2(30),
    nombre varchar2(30),
    domicilio varchar2(30),
    seccion varchar2(20),
    sueldo number(8,2)
);

insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contabilidad',3000);
insert into empleados values('32323255','Gonzales','Miguel','Calle 4ta No.90','Contabilidad',8000);
insert into empleados values('56565555','Suarez','Tomas','Atarazana 78','Cobros',1500);

select * from empleados;

/* + cursor implicito */

/*  Atributos de los cursores 
%isopen true si esta abierto
%found true si se ha encontrado un registro
%notfound true si no se pudo encontrar el registro   
%rowcount numero de registros afectados
*/

/* hacer un cuersor que actuliza y cuente cuantos campos se han actualizado */

declare
    filas number(2);
begin
    update empleados set sueldo = sueldo + 1500 where sueldo>=4000;

    if sql%notfound then
        dbms_output.put_line('No hay empleados disponibles');
    elsif sql%found then
        filas:=sql%rowcount;
        dbms_output.put_line(filas || ' Empleados actualizados');
    end if;
end;

/* * cursor explicitos
fecht es buscar*/

declare
    v_docu empleados.documento%type;
    v_nom empleados.nombre%type;
    v_ape empleados.apellido%type;
    v_suel empleados.sueldo%type;
cursor c_cursor2 is
        select documento,nombre,apellido,sueldo
        from empleados
        where documento=22222222;
begin
    open c_cursor2;
        fetch c_cursor2 into v_docu,v_nom,v_ape,v_suel;
    close c_cursor2;
    dbms_output.put_line('Documento ' || v_docu);
    dbms_output.put_line('Nombre ' || v_nom);
    dbms_output.put_line('Apellido ' || v_ape);
    dbms_output.put_line('Sueldo ' || v_suel);
end;


drop table productos_ABC;

create table productos_ABC(
    id_producto int not null,
    nombre_producto VARCHAR2(25),
    precio NUMBER(6,2),
    descripcion VARCHAR2(50)
);

insert into productos_ABC values(1,'Abrazadera',560,'Abrazadera de media pulgada');
insert into productos_ABC values(2,'Destornillador',120,'destornillador cabeza plana');
insert into productos_ABC values(3,'Martillo',300,'Martillo con ganzua');
insert into productos_ABC values(4,'Llave inglesa',200,'Llave inglesa de plomeria');
insert into productos_ABC values(5,'Pasadores RTR',935,'Tuerca exagonal de Almenada');
insert into productos_ABC values(6,'Tornillo exagonal',90,'Tornillo exagonal de baja o tuerca');

select * from productos_ABC;

declare
    v_nom productos_ABC.nombre_producto%type;
    v_pre productos_ABC.precio%type;
        
    cursor c_productos(idprod productos_ABC.id_producto%type) is
        select nombre_producto, precio from productos_ABC
        where id_producto>idprod;
begin
    open c_productos(2);
    loop
        fetch c_productos into v_nom,v_pre;
        exit when c_productos%notfound;
        dbms_output.put_line('Articulo: '||v_nom||' precio: '||v_pre);
    end loop;
    close c_productos;
end;