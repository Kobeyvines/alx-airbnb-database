-- performance.sql

-- ✅ Initial Complex Query
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    bookings b
JOIN
    users u ON b.user_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id
JOIN
    payments pay ON pay.booking_id = b.booking_id;

-- ✅ Performance Analysis – Initial Query
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    bookings b
JOIN
    users u ON b.user_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id
JOIN
    payments pay ON pay.booking_id = b.booking_id;

-- ✅ Refactored Optimized Query with LEFT JOINs
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    bookings b
LEFT JOIN
    users u ON b.user_id = u.user_id
LEFT JOIN
    properties p ON b.property_id = p.property_id
LEFT JOIN
    payments pay ON pay.booking_id = b.booking_id;

-- ✅ Performance Analysis – Refactored Query
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    bookings b
LEFT JOIN
    users u ON b.user_id = u.user_id
LEFT JOIN
    properties p ON b.property_id = p.property_id
LEFT JOIN
    payments pay ON pay.booking_id = b.booking_id;

-- ✅ Filtered Query 1: Retrieve bookings for a specific user by email
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    bookings b
JOIN
    users u ON b.user_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id
LEFT JOIN
    payments pay ON pay.booking_id = b.booking_id
WHERE
    u.email = 'john.doe@example.com';

-- ✅ Filtered Query 2: Retrieve bookings within a specific date range
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location
FROM
    bookings b
JOIN
    users u ON b.user_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id
WHERE
    b.start_date >= '2025-07-01'
    AND b.end_date <= '2025-07-31';

-- ✅ Filtered Query 3: Retrieve properties in a specific location with bookings
SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    COUNT(b.booking_id) AS total_bookings
FROM
    properties p
JOIN
    bookings b ON p.property_id = b.property_id
WHERE
    p.location = 'Nairobi'
GROUP BY
    p.property_id,
    p.name,
    p.location;
