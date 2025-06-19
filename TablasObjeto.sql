CREATE TABLE store(
    codigo NUMBER,
    estante NUMBER,
    item producto
);

DESCRIBE store;

INSERT INTO store VALUES(1, 10, producto(333, 'Laptop', 3500));
INSERT INTO store VALUES(2, 12, producto(444, 'Mouse', 55));
INSERT INTO store VALUES(3, 13, producto(555, 'Teclado', 120));



SELECT * FROM store;


SELECT s.item.ver_producto()
FROM STORE s;

SELECT * FROM store WHERE CODIGO<5;

SELECT codigo, estante, s.item.ver_producto() FROM store s;
SELECT codigo, estante, s.item.ver_producto() FROM store s WHERE s.codigo = 1;

UPDATE STORE s set s.item.precio = 100 WHERE codigo = 1;

