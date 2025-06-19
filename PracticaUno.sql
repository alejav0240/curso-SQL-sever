-- *Tabla de Multiplicar

-- ! Usando LOOP
DECLARE
    v_base NUMBER := :base; -- Cambia este valor para la base deseada
    v_contador NUMBER := 1;
BEGIN
    LOOP
        EXIT WHEN v_contador > 10; -- Condición de salida
        DBMS_OUTPUT.PUT_LINE(v_base || ' x ' || v_contador || ' = ' || (v_base * v_contador));
        v_contador := v_contador + 1;
    END LOOP;
END;

-- ! Usando WHILE
DECLARE
    v_base NUMBER := :base; -- Cambia este valor para la base deseada
    v_contador NUMBER := 1;
BEGIN
    WHILE v_contador <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(v_base || ' x ' || v_contador || ' = ' || (v_base * v_contador));
        v_contador := v_contador + 1;
    END LOOP;
END;

-- ! Usando FOR
DECLARE
    v_base NUMBER := :base; -- Cambia este valor para la base deseada
BEGIN
    FOR v_contador IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(v_base || ' x ' || v_contador || ' = ' || (v_base * v_contador));
    END LOOP;
END;


-- * Suma de un Número N
-- ! Usando LOOP
DECLARE
    v_n NUMBER := :num; -- Cambia este valor para el número deseado
    v_suma NUMBER := 0;
    v_contador NUMBER := 1;
BEGIN
    LOOP
        EXIT WHEN v_contador > v_n; -- Condición de salida
        v_suma := v_suma + v_contador;
        v_contador := v_contador + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('La suma de los números del 1 al ' || v_n || ' es: ' || v_suma);
END;


-- ! Usando WHILE
DECLARE
    v_n NUMBER := :num; -- Cambia este valor para el número deseado
    v_suma NUMBER := 0;
    v_contador NUMBER := 1;
BEGIN
    WHILE v_contador <= v_n LOOP
        v_suma := v_suma + v_contador;
        v_contador := v_contador + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('La suma de los números del 1 al ' || v_n || ' es: ' || v_suma);
END;


-- ! Usando FOR
DECLARE
    v_n NUMBER := :num; -- Cambia este valor para el número deseado
    v_suma NUMBER := 0;
BEGIN
    FOR v_contador IN 1..v_n LOOP
        v_suma := v_suma + v_contador;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('La suma de los números del 1 al ' || v_n || ' es: ' || v_suma);
END;

-- * Factorial de un Número N
-- ! Usando LOOP
DECLARE
    v_n NUMBER := :num; -- Cambia este valor para el número deseado
    v_factorial NUMBER := 1;
    v_contador NUMBER := 1;
BEGIN
    LOOP
        EXIT WHEN v_contador > v_n; -- Condición de salida
        v_factorial := v_factorial * v_contador;
        v_contador := v_contador + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('El factorial de ' || v_n || ' es: ' || v_factorial);
END;
/

-- ! Usando WHILE
DECLARE
    v_n NUMBER := :num; -- Cambia este valor para el número deseado
    v_factorial NUMBER := 1;
    v_contador NUMBER := 1;
BEGIN
    WHILE v_contador <= v_n LOOP
        v_factorial := v_factorial * v_contador;
        v_contador := v_contador + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('El factorial de ' || v_n || ' es: ' || v_factorial);
END;
/

-- ! Usando FOR
DECLARE
    v_n NUMBER := :num; -- Cambia este valor para el número deseado
    v_factorial NUMBER := 1;
BEGIN
    FOR v_contador IN 1..v_n LOOP
        v_factorial := v_factorial * v_contador;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('El factorial de ' || v_n || ' es: ' || v_factorial);
END;
/