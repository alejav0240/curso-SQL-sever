DECLARE
    operacion VARCHAR2(50) := UPPER(:operacion);
    argUno NUMBER := :argUno;
    argDos NUMBER := :argDos;
    res NUMBER := 2;
BEGIN
    IF operacion = 'SUMA' THEN
        res := argUno + argDos;
        DBMS_OUTPUT.PUT_LINE('El resultado es : ' || res );
    ELSIF operacion = 'RESTA' THEN
        res := argUno - argDos;
        DBMS_OUTPUT.PUT_LINE('El resultado es : ' || res );
    ELSIF operacion = 'PRODUCTO' THEN
        res := argUno * argDos;
        DBMS_OUTPUT.PUT_LINE('El resultado es : ' || res );
    ELSIF argDos <> 0 AND  operacion = 'DIVISION' THEN
        res := argUno / argDos;
        DBMS_OUTPUT.PUT_LINE('El resultado es : ' || res );
    ELSE
        DBMS_OUTPUT.PUT_LINE('Operacion no valida' );
    END IF;
END;