/*1.	UNA FRUTERÍA OFRECE MANZANAS CON DESCUENTO SEGÚN LA SIGUIENTE TABLA:
		NRO. KILOS COMPRADOS		%DESCUENTO
			0 – 2					0%
			2.01 – 5				10%
			5.01 – 10				15%
			10.01 EN ADELANTE			20%
DETERMINAR CUANTO PAGARÁ UNA PERSONA QUE COMPRE MANZANAS EN ESA FRUTERÍA, 
SI EL KILO DE MANZANAS CUESTA 13.70 Bs.*/
declare
    kilos_comprados number;
    precio_kilo number;
    precio_total number;
begin
    precio_kilo:=13.70;
    kilos_comprados:= &kilo;
    precio_total:=kilos_comprados*precio_kilo;
    dbms_output.put_line('El precio total es: ' || precio_total);
    case
        when kilos_comprados>0 and kilos_comprados<=2 then
            precio_total:= precio_total;
        when kilos_comprados>2.01 and kilos_comprados<=5 then
            precio_total:= precio_total *0.90;
        when kilos_comprados>5.01 and kilos_comprados<=10 then
            precio_total:= precio_total*0.85;
        when kilos_comprados>10.01 then
            precio_total:= precio_total * 0.80;
    end case; 
    dbms_output.put_line('El precio con descuento es: ' || precio_total);
end;
/*2.	REALIZAR EL INCREMENTO DEL BONO DE PROFESIÓN DE ACUERDO CON LAS SIGUIENTES 
CATEGORÍAS: CATEGORÍA: A=2,5%, B=3%, C=4%, D=4,5%. PARA CUALQUIER OTRA CATEGORÍA 
INCREMENTAR EL 5%, SE DEBE INTRODUCIR EL SALARIO Y LA CATEGORÍA.*/
DECLARE
    salario NUMBER;
    categoria VARCHAR2(1);
BEGIN
    salario := :salario;
    categoria := :categoria;

    CASE categoria
        WHEN 'A' THEN salario := salario * 1.025;
        WHEN 'B' THEN salario := salario * 1.03;
        WHEN 'C' THEN salario := salario * 1.04;
        WHEN 'D' THEN salario := salario * 1.045;
        ELSE salario := salario * 1.05;
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE('El nuevo Salario es: '||salario);
END;

/*3.	MULTIPLICAR DOS NÚMEROS MEDIANTE SUMAS SUCESIVAS*/
DECLARE 
    a integer;
    b integer;
    c integer;
BEGIN
    a:= :val1;
    b:= :val2;
    c:= 0;
    for i in 1..b loop
        c:=c+a;
    end loop;
    DBMS_OUTPUT.PUT_LINE('El resultado es: ' || c);
END;
/*4.	CALCULAR potencia AB, MEDIANTE MULTIPLICACIONES SUCESIVAS.*/
declare
    a integer;
    b integer;
    c integer;
begin
    a:= :val1;
    b:= :val2;
    c:= 1;

    for i in 1..b loop
        c:=c*a;
    end loop;
    dbms_output.put_line('El resultado es: ' || c);
end;
/*5.	INTRODUCIR UN NUMERO N Y MOSTRAR CUANTOS DÍGITOS TIENE (AMBOS GRUPOS)*/
declare
    n integer;
    c integer;
begin
    n:= :numero;
    c:=0;
    while n<>0 loop
        n:=n/10;
        c:=c+1;
    end loop;
    dbms_output.put_line('La cantidad de digitos es: ' || c);
end;
