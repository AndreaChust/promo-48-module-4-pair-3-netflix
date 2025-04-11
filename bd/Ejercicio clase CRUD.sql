CREATE DATABASE store;
USE store;

CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(130) NOT NULL,
    brand VARCHAR(50) NOT NULL, 
    price FLOAT NOT NULL,
    size VARCHAR(10), 
    quantity INT NOT NULL
);

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR (130) NOT NULL
);

CREATE TABLE shopping_carts (
	idCart INT AUTO_INCREMENT, 
    name VARCHAR(45),
    PRIMARY KEY (idCart)
);

-- CREATE --> INSERT INTO

INSERT INTO products (name, brand, price, quantity, size)
VALUES ("headphones", "philips", 85, 2, "medium");

INSERT INTO products (name, brand, price, quantity, size)
VALUES
	("watch", "rolex", 220, 1, "small"),
    ("mobile phone", "lg", 120, 3, "small"),
    ("laptop", "hp", 1000, 1, "small");
    
    -- READ --> SELECT --- FROM
    SELECT * FROM products;
    
    SELECT name, brand, price FROM products;
    
    -- Mostrar la informacion del producto con el id 1
    
    SELECT id, name, price FROM products WHERE id = 1;
    
    -- Mostrar los productos que cuesten más de 100 euros
    
    SELECT name, price FROM products WHERE price >= 100;
    
    -- Filtrar por marca: lg
    
    SELECT * FROM products WHERE brand = "lg";
    
    -- Filtrar por marca: lg y hp
    SELECT * FROM products WHERE brand = "lg" OR brand = "hp";
    SELECT * FROM products WHERE brand IN ("lg", "hp"); -- varios valores en una misma columna
    
    -- tamaño medio y mas de una cantidad
    
	SELECT * FROM products WHERE size = "medium" AND quantity > 1;
    
    -- mostrar los productos que incluyen "phone" en su nombre
    
    SELECT * FROM products WHERE name LIKE "%phone"; -- % significa cualquier valor, y pondríamos uno por delante y por detras para que muestre todo lo que hay por delante y por detrás
    
    -- ORDER BY para ordenar los productos
    
    SELECT * FROM products ORDER BY price DESC;
    
    SELECT * FROM products
    WHERE brand IN ("lg", "hp")
    ORDER BY price ASC;
    
    -- UPDATE modifica un elemento de la tabla que ya existe
    -- SIEMPRE incluimos WHERE
    
    -- La cantidad del movil es ahora 5
    UPDATE products SET quantity = 5 WHERE id = 3;
    
    UPDATE products SET price = 95, size = "big" WHERE id = 1;
    
    -- Incremente el precio en un 40%
    
    UPDATE products SET price = price * 1.4 WHERE id = 2;
    
    -- DELETE
    
    DELETE FROM products WHERE id = 3;
    
    
    
    
    
    