DECLARE 
    valor NUMBER := 10;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Valor: ' || valor);
        valor := valor + 10;
        IF valor > 50 THEN
            EXIT;
        END IF;
    END LOOP;
END;

DECLARE 
    valor NUMBER := 10;
BEGIN
    WHILE valor<20 LOOP
            DBMS_OUTPUT.PUT_LINE('Valor: ' || valor);
            valor := valor + 1;
    END LOOP;
END;

DECLARE 
    valor NUMBER := 10;
BEGIN
    FOR i IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Valor: ' || i);
    END LOOP;
END;
--comprobacion de un valor
DECLARE
    valor CHAR(1) := UPPER(:valor);
BEGIN
    CASE 
        WHEN valor = 'A' THEN DBMS_OUTPUT.PUT_LINE('Particular');
        WHEN valor = 'B' THEN DBMS_OUTPUT.PUT_LINE('Liviano');
        WHEN valor = 'C' THEN DBMS_OUTPUT.PUT_LINE('Pesado');
        WHEN valor = 'M' THEN DBMS_OUTPUT.PUT_LINE('Motocicleta');
        ELSE DBMS_OUTPUT.PUT_LINE('No tiene permiso para conducir');
    END CASE;
END;
--busqueda de un valor
DECLARE
    valor CHAR(1) := UPPER(:valor);
    result VARCHAR2(20);
BEGIN
    result := CASE valor
        WHEN 'A' THEN 'Particular'
        WHEN 'B' THEN 'Liviano'
        WHEN 'C' THEN 'Pesado'
        WHEN 'M' THEN 'Motocicleta'
        ELSE 'No tiene permiso para conducir'
    END;
    DBMS_OUTPUT.PUT_LINE(result);
END;
