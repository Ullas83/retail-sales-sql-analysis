-- ============================================================
-- Retail Sales SQL Analysis Queries
-- Run against the database created by schema_and_data.sql
-- ============================================================

-- ============================================================
-- SECTION 1: BASIC QUERIES (Joins & Filters)
-- ============================================================

-- Query 1: All orders with customer names and dates
-- Concept: INNER JOIN
SELECT
    o.order_id,
    c.name       AS customer_name,
    c.region,
    o.order_date,
    o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;

-- ============================================================

-- Query 2: Full order details with product info
-- Concept: Multi-table JOIN
SELECT
    o.order_id,
    c.name          AS customer_name,
    p.name          AS product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS line_total
FROM order_items oi
JOIN orders   o ON oi.order_id  = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products  p ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- ============================================================

-- Query 3: Customers who have never placed an order
-- Concept: LEFT JOIN, IS NULL
SELECT
    c.customer_id,
    c.name,
    c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- ============================================================

-- Query 4: Products that have never been ordered
-- Concept: LEFT JOIN, IS NULL
SELECT
    p.product_id,
    p.name,
    p.category,
    p.unit_price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.item_id IS NULL;

-- ============================================================

-- Query 5: Orders with status = 'cancelled'
-- Concept: WHERE filter with JOIN
SELECT
    o.order_id,
    c.name     AS customer_name,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status