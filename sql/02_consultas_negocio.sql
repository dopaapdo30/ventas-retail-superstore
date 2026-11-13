-- 1. Top 10 productos con mayor volumen de ingresos
SELECT 
    p.product_id,
    p.product_name,
    SUM(od.sales) AS total_sales
FROM 
    products p
JOIN 
    order_details od ON p.product_id = od.product_id
GROUP BY 
    p.product_id,
    p.product_name
ORDER BY 
    total_sales DESC
LIMIT 10;


-- 2. Top 5 Clientes VIP (Mayor volumen de compra)
SELECT 
    c.customer_id,
    c.customer_name,
    c.segment,
    SUM(od.sales) AS total_gastado
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    order_details od ON o.order_id = od.order_id
GROUP BY 
    c.customer_id,
    c.customer_name,
    c.segment
ORDER BY 
    total_gastado DESC
LIMIT 5;

-- 3. Ventas totales por Categoría y Subcategoría
SELECT 
    p.category,
    p.sub_category,
    SUM(od.sales) AS total_ventas
FROM 
    products p
JOIN 
    order_details od ON p.product_id = od.product_id
GROUP BY 
    p.category,
    p.sub_category
ORDER BY 
    total_ventas DESC;

-- 4. Evolución de ventas año tras año (Crecimiento de la empresa)
SELECT 
    EXTRACT(YEAR FROM o.order_date) AS anio,
    SUM(od.sales) AS ingresos_totales
FROM 
    orders o
JOIN 
    order_details od ON o.order_id = od.order_id
GROUP BY 
    EXTRACT(YEAR FROM o.order_date)
ORDER BY 
    anio ASC;
-- 5. Ingresos totales por Región (Análisis Geográfico)
SELECT 
    o.region,
    SUM(od.sales) AS ventas_totales
FROM 
    orders o
JOIN 
    order_details od ON o.order_id = od.order_id
GROUP BY 
    o.region
ORDER BY 
    ventas_totales DESC;