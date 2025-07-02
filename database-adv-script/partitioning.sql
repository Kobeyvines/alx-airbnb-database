-- partitioning.sql

--  Drop existing bookings table if it exists (only for testing purposes, optional)
-- DROP TABLE IF EXISTS bookings;

--  Recreate the bookings table with partitioning by RANGE on start_date

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES properties(property_id),
    user_id UUID NOT NULL REFERENCES users(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create partitions for different date ranges

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_future PARTITION OF bookings
    FOR VALUES FROM ('2026-01-01') TO ('2030-01-01');

-- Test query to measure performance

EXPLAIN ANALYZE
SELECT
    *
FROM
    bookings
WHERE
    start_date BETWEEN '2025-07-01' AND '2025-07-31';
