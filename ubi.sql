CREATE TABLE ubicaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL
);

INSERT INTO ubicaciones (name, address, latitude, longitude)
VALUES
    ('Casa', 'Calle Falsa 123', 40.7128, -74.0060),
    ('Parque', 'Avenida Imaginaria 456', 34.0522, -118.2437),
    ('Colegio', 'Calle Inventada 789', 41.8781, -87.6298),
    ('Lugar X', 'Calle Desconocida 987', 29.7604, -95.3698),
    ('Lugar Y', 'Avenida Irreal 654', 39.9526, -75.1652),
    ('Lugar Z', 'Calle Imaginada 321', 37.7749, -122.4194),
    ('Lugar W', 'Avenida Ficticia 654', 32.7157, -117.1611),
    ('Lugar V', 'Calle Irreal 987', 33.4484, -112.0740),
    ('Lugar U', 'Avenida Desconocida 654', 35.6895, 139.6917),
    ('Lugar S', 'Calle Ficticia 321', 51.5074, -0.1278),
    ('Lugar R', 'Avenida Inventada 987', 48.8566, 2.3522),
    ('Lugar Q', 'Calle Imaginaria 654', 55.7558, 37.6176),
    ('Lugar P', 'Avenida Desconocida 321', 40.4168, -3.7038),
    ('Lugar O', 'Calle Ficticia 987', 52.5200, 13.4050),
    ('Lugar N', 'Avenida Irreal 654', 45.4642, 9.1900),
    ('Lugar M', 'Calle Inventada 321', 35.6895, 139.6917),
    ('Lugar L', 'Avenida Ficticia 987', 37.7749, -122.4194),
    ('Lugar K', 'Calle Irreal 654', 34.0522, -118.2437),
    ('Lugar J', 'Avenida Desconocida 321', 40.7128, -74.0060),
    ('Lugar I', 'Calle Falsa 987', 41.8781, -87.6298);
    
INSERT INTO ubicaciones (name, address, latitude, longitude)
VALUES
    ('Location 1', 'Address 1', 40.7128, -74.0060),
    ('Location 2', 'Address 2', 34.0522, -118.2437),
    ('Location 3', 'Address 3', 41.8781, -87.6298),
    ('Location 4', 'Address 4', 29.7604, -95.3698),
    ('Location 5', 'Address 5', 39.9526, -75.1652),
    ('Location 6', 'Address 6', 37.7749, -122.4194),
    ('Location 7', 'Address 7', 32.7157, -117.1611),
    ('Location 8', 'Address 8', 33.4484, -112.0740),
    ('Location 9', 'Address 9', 35.6895, 139.6917),
    ('Location 10', 'Address 10', 51.5074, -0.1278),
    ('Location 11', 'Address 11', 48.8566, 2.3522),
    ('Location 12', 'Address 12', 55.7558, 37.6176),
    ('Location 13', 'Address 13', 40.4168, -3.7038),
    ('Location 14', 'Address 14', 52.5200, 13.4050),
    ('Location 15', 'Address 15', 45.4642, 9.1900),
    ('Location 16', 'Address 16', 35.6895, 139.6917),
    ('Location 17', 'Address 17', 37.7749, -122.4194),
    ('Location 18', 'Address 18', 34.0522, -118.2437),
    ('Location 19', 'Address 19', 40.7128, -74.0060),
    ('Location 20', 'Address 20', 41.8781, -87.6298);





    INSERT INTO `dbdemo`.`producto` (descripcion, codigobarra, precio)
    VALUES
        ('Producto 1', '123456789', 10.99),
        ('Producto 2', '987654321', 15.99),
        ('Producto 3', '456789123', 20.50),
        ('Producto 4', '321654987', 5.99),
        ('Producto 5', '789123456', 8.75),
        ('Producto 6', '654987321', 12.99),
        ('Producto 7', '987123654', 18.25),
        ('Producto 8', '321789654', 9.99),
        ('Producto 9', '654321789', 14.50),
        ('Producto 10', '789654321', 7.99),
        ('Producto 11', '123789456', 11.75),
        ('Producto 12', '456321987', 16.99),
        ('Producto 13', '987456123', 22.50),
        ('Producto 14', '321987456', 13.99),
        ('Producto 15', '654123789', 19.25);

