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

-- ✅ Performance Analysis

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

-- ✅ Refactored Optimized Query

-- Ensure indexes exist on:
-- users(user_id), bookings(user_id), bookings(property_id), properties(property_id), payments(booking_id)

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
