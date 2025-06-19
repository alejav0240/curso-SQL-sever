/*1.	UNA FRUTERÍA OFRECE MANZANAS CON DESCUENTO SEGÚN LA SIGUIENTE TABLA:
		NRO. KILOS COMPRADOS		%DESCUENTO
			0 – 2					0%
			2.01 – 5				10%
			5.01 – 10				15%
			10.01 EN ADELANTE			20%
DETERMINAR CUANTO PAGARÁ UNA PERSONA QUE COMPRE MANZANAS EN ESA FRUTERÍA, 
SI EL KILO DE MANZANAS CUESTA 13.70 Bs.*/
DECLARE
    kilos NUMBER := &num;
    precio NUMBER := 13.70;
    descuento NUMBER := 0;
    total NUMBER := 0;
BEGIN
    total := kilos * precio;
    CASE
        WHEN kilos BETWEEN 0 AND 2 THEN
            descuento := 0;
        WHEN kilos BETWEEN 2.01 AND 5 THEN
            descuento := 10;
        WHEN kilos BETWEEN 5.01 AND 10 THEN
            descuento := 15;
        ELSE
            descuento := 20;
    END CASE;
    total := total - (total * descuento / 100);
    DBMS_OUTPUT.PUT_LINE('Kilos :'||kilos||' Total a pagar: ' || total);
END;
/*2.	REALIZAR EL INCREMENTO DEL BONO DE PROFESIÓN DE ACUERDO CON LAS SIGUIENTES 
CATEGORÍAS: CATEGORÍA: A=2,5%, B=3%, C=4%, D=4,5%. PARA CUALQUIER OTRA CATEGORÍA 
INCREMENTAR EL 5%, SE DEBE INTRODUCIR EL SALARIO Y LA CATEGORÍA.*/
DECLARE
    salario NUMBER := :salario;
    categoria CHAR := UPPER(:categoria);
    bono NUMBER := 0;
BEGIN
    CASE categoria
        WHEN 'A' THEN
            bono := salario * 0.025;
        WHEN 'B' THEN
            bono := salario * 0.03;
        WHEN 'C' THEN
            bono := salario * 0.04;
        WHEN 'D' THEN
            bono := salario * 0.045;
        ELSE
            bono := salario * 0.05;
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Salario: '||salario||' Bono: ' || bono||' Total: ' || (salario + bono));
END;
DECLARE
    salario NUMBER;
    categoria VARCHAR2(1);
BEGIN
    salario := :salario;
    categoria := :categoria;

    CASE categoria
        WHEN 'A' THEN
            salario := salario * 1.025;
        WHEN 'B' THEN
            salario := salario * 1.03;
        WHEN 'C' THEN
            salario := salario * 1.04;
        WHEN 'D' THEN
            salario := salario * 1.045;
        ELSE
            salario := salario * 1.05;
    END CASE;
    DBMS_OUTPUT.PUT_LINE('El nuevo Salario es: '||salario);
END;
/*3.	MULTIPLICAR DOS NÚMEROS MEDIANTE SUMAS SUCESIVAS*/
DECLARE
    num1 NUMBER := :num1;
    num2 NUMBER := :num2;
    resultado NUMBER := 0;
BEGIN
    FOR i IN 1..num2 LOOP
        resultado := resultado + num1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE( num1||' x ' || num2 ||' = ' || resultado);
END;
/*4.	CALCULAR potencia AB, MEDIANTE MULTIPLICACIONES SUCESIVAS.*/
DECLARE
    a NUMBER := :a;
    b NUMBER := :b;
    resultado NUMBER := 0;
BEGIN
    resultado := a;
    FOR i IN 2..b LOOP
        resultado := resultado * a;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE( a||' ^ ' || b ||' = ' || resultado);
END;
/*5.	INTRODUCIR UN NUMERO N Y MOSTRAR CUANTOS DÍGITOS TIENE (AMBOS GRUPOS)*/
DECLARE
    num INTEGER := :num;
    digitos NUMBER := 0;
BEGIN
    WHILE num > 0 LOOP
        num := num / 10;
        digitos := digitos + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('El número tiene ' || digitos || ' dígitos');
END;
