-- ============================================================
-- Retail Sales Database: Schema + Sample Data
-- Compatible with SQLite, PostgreSQL, MySQL
-- ============================================================

-- Drop tables if they exist (for re-runs)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- ============================================================
-- CUSTOMERS
-- ============================================================
CREATE TABLE customers (
    customer_id   INTEGER PRIMARY KEY,
    name          TEXT NOT NULL,
    email         TEXT,
    region        TEXT,
    joined_date   DATE
);

INSERT INTO customers VALUES
(1,  'Alice Martin',   'alice@email.com',   'North', '2021-03-15'),
(2,  'Bob Chen',       'bob@email.com',     'South', '2021-07-22'),
(3,  'Carol Smith',    'carol@email.com',   'East',  '2022-01-10'),
(4,  'David Lee',      'david@email.com',   'West',  '2022-04-05'),
(5,  'Eva Brown',      'eva@email.com',     'North', '2022-08-19'),
(6,  'Frank Wilson',   'frank@email.com',   'South', '2023-02-28'),
(7,  'Grace Kim',      'grace@email.com',   'East',  '2023-05-14'),
(8,  'Hank Torres',    'hank@email.com',    'West',  '2023-09-01'),
(9,  'Iris Patel',     'iris@email.com',    'North', '2023-11-20'),
(10, 'Jake Nguyen',    'jake@email.com',    'South', '2024-01-08');

-- ============================================================
-- PRODUCTS
-- ============================================================
CREATE TABLE products (
    product_id   INTEGER PRIMARY KEY,
    name         TEXT NOT NULL,
    category     TEXT,
    unit_price   DECIMAL(10,2)
);

INSERT INTO products VALUES
(1,  'Laptop Pro 15',      'Electronics',  1299.99),
(2,  'Wireless Mouse',     'Electronics',    29.99),
(3,  'USB-C Hub',          'Electronics',    49.99),
(4,  'Standing Desk',      'Furniture',     449.00),
(5,  'Ergonomic Chair',    'Furniture',     389.00),
(6,  'Desk Lamp',          'Furniture',      39.99),
(7,  'Notebook Set',       'Stationery',     12.99),
(8,  'Ballpoint Pens 10x', 'Stationery',     8.49),
(9,  'Sticky Notes Pack',  'Stationery',     5.99),
(10, 'Coffee Maker',       'Appliances',   129.99),
(11, 'Water Filter',       'Appliances',    89.99),
(12, 'Bluetooth Speaker',  'Electronics',   79.99),
(13, 'Monitor 27"',        'Electronics',  399.99),
(14, 'Mechanical Keyboard','Electronics',  149.99),
(15, 'Whiteboard',         'Furniture',    199.00);

-- ============================================================
-- ORDERS
-- ============================================================
CREATE TABLE orders (
    order_id    INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date  DATE,
    status      TEXT
);

INSERT INTO orders VALUES
(1001, 1,  '2023-01-12', 'completed'),
(1002, 2,  '2023-01-25', 'completed'),
(1003, 3,  '2023-02-03', 'completed'),
(1004, 1,  '2023-02-18', 'completed'),
(1005, 4,  '2023-03-07', 'completed'),
(1006, 5,  '2023-03-22', 'completed'),
(1007, 2,  '2023-04-10', 'completed'),
(1008, 6,  '2023-04-28', 'cancelled'),
(1009, 3,  '2023-05-15', 'completed'),
(1010, 7,  '2023-05-30', 'completed'),
(1011, 4,  '2023-06-14', 'completed'),
(1012, 8,  '2023-06-29', 'completed'),
(1013, 1,  '2023-07-08', 'completed'),
(1014, 9,  '2023-07-25', 'completed'),
(1015, 5,  '2023-08-12', 'completed'),
(1016, 10, '2023-08-27', 'completed'),
(1017, 6,  '2023-09-09', 'completed'),
(1018, 2,  '2023-09-24', 'completed'),
(1019, 7,  '2023-10-11', 'completed'),
(1020, 3,  '2023-10-30', 'completed'),
(1021, 8,  '2023-11-14', 'completed'),
(1022, 1,  '2023-11-29', 'completed'),
(1023, 9,  '2023-12-05', 'completed'),
(1024, 10, '2023-12-20', 'completed'),
(1025, 5,  '2024-01-08', 'completed');

-- ============================================================
-- ORDER ITEMS
-- ============================================================
CREATE TABLE order_items (
    item_id     INTEGER PRIMARY KEY,
    order_id    INTEGER REFERENCES orders(order_id),
    product_id  INTEGER REFERENCES products(product_id),
    quantity    INTEGER,
    unit_price  DECIMAL(10,2)  -- price at time of purchase
);

INSERT INTO order_items VALUES
(1,  1001, 1,  1, 1299.99),
(2,  1001, 2,  2,   29.99),
(3,  1002, 3,  1,   49.99),
(4,  1002, 10, 1,  129.99),
(5,  1003, 4,  1,  449.00),
(6,  1003, 6,  2,   39.99),
(7,  1004, 14, 1,  149.99),
(8,  1004, 2,  1,   29.99),
(9,  1005, 5,  1,  389.00),
(10, 1005, 7,  3,   12.99),
(11, 1006, 13, 1,  399.99),
(12, 1006, 12, 1,   79.99),
(13, 1007, 11, 2,   89.99),
(14, 1007, 8,  5,    8.49),
(15, 1009, 1,  1, 1299.99),
(16, 1009, 3,  2,   49.99),
(17, 1010, 15, 1,  199.00),
(18, 1010, 9,  4,    5.99),
(19, 1011, 13, 2,  399.99),
(20, 1011, 2,  3,   29.99),
(21, 1012, 4,  1,  449.00),
(22, 1012, 6,  1,   39.99),
(23, 1013, 1,  1, 1299.99),
(24, 1013, 14, 1,  149.99),
(25, 1014, 12, 2,   79.99),
(26, 1014, 10, 1,  129.99),
(27, 1015, 5,  1,  389.00),
(28, 1015, 7,  2,   12.99),
(29, 1016, 3,  3,   49.99),
(30, 1016, 8,  10,   8.49),
(31, 1017, 13, 1,  399.99),
(32, 1017, 11, 1,   89.99),
(33, 1018, 1,  1, 1299.99),
(34, 1018, 2,  2,   29.99),
(35, 1019, 15, 1,  199.00),
(36, 1019, 6,  3,   39.99),
(37, 1020, 4,  1,  449.00),
(38, 1020, 9,  6,    5.99),
(39, 1021, 13, 1,  399.99),
(40, 1021, 12, 1,   79.99),
(41, 1022, 1,  1, 1299.99),
(42, 1022, 3,  1,   49.99),
(43, 1023, 14, 2,  149.99),
(44, 1023, 7,  4,   12.99),
(45, 1024, 10, 1,  129.99),
(46, 1024, 11, 1,   89.99),
(47, 1025, 13, 1,  399.99),
(48, 1025, 2,  2,   29.99);

-- Note: Order 1008 (cancelled) has no items intentionally,
-- and Order 1017 has items despite being by a customer who also has a cancelled order.