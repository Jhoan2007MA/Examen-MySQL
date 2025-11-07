-- Active: 1762548601169@@gateway01.us-east-1.prod.aws.tidbcloud.com@4000@test
CREATE TABLE customer (
    id_customer INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono INT,
    created_at DATETIME
);

CREATE TABLE address (
    id_address INT PRIMARY KEY AUTO_INCREMENT,
    id_customer INT,
    calle VARCHAR(150),
    ciudad VARCHAR(100),
    detalles VARCHAR(255),
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer)
);

CREATE TABLE orders (
    id_order INT PRIMARY KEY AUTO_INCREMENT,
    tiempo_orden DATETIME,
    tipo_orden TEXT,
    estado TEXT,
    total_cantidad INT,
    id_customer INT,
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer)
);

CREATE TABLE addition (
    id_addition INT PRIMARY KEY AUTO_INCREMENT,
    nombre TEXT,
    id_order INT,
    FOREIGN KEY (id_order) REFERENCES orders(id_order)
);

CREATE TABLE product (
    id_product INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    precio INT,
    tipo_de_producto TEXT,
    is_active BOOLEAN,
    id_order INT,
    FOREIGN KEY (id_order) REFERENCES orders(id_order)
);

CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    id_product INT,
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);

CREATE TABLE combo (
    id_combo INT PRIMARY KEY AUTO_INCREMENT,
    nombre TEXT,
    descripcion TEXT,
    precio INT,
    cantidad INT
);

CREATE TABLE combo_item (
    id_combo INT,
    id_product INT,
    precio INT,
    cantidad INT,
    PRIMARY KEY (id_combo, id_product),
    FOREIGN KEY (id_combo) REFERENCES combo(id_combo),
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);