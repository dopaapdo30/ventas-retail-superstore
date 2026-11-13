-- 1. Tabla de Clientes
-- Almacena la información única de cada comprador.
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    segment VARCHAR(50)
);

-- 2. Tabla de Productos
-- Almacena el catálogo de artículos del supermercado.
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255)
);

-- 3. Tabla de Pedidos (Orders)
-- Registra la transacción general, las fechas y la ubicación de envío.
-- Se conecta con la tabla customers mediante el customer_id.
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    customer_id VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Tabla de Detalle de Pedidos (Order Details)
-- Desglosa qué productos se compraron en cada pedido y el monto de la venta.
-- Usamos el row_id original de tu CSV como llave primaria.
CREATE TABLE order_details (
    row_id INTEGER PRIMARY KEY,
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    sales NUMERIC(10, 2), -- NUMERIC es el estándar en Postgres para dinero/ventas
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
DELETE FROM customers;