--Before Indexing
EXPLAIN ANALYZE
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.user_id
WHERE users.email = 'sample@example.com';



-- database_index.sql

-- ✅ Index on user_id for faster JOINs and WHERE queries
CREATE INDEX idx_users_user_id ON users(user_id);

-- ✅ Index on email for quick user login lookup
CREATE INDEX idx_users_email ON users(email);

-- ✅ Index on property_id for JOINs and WHERE queries
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- ✅ Index on location for queries filtering or ordering by location
CREATE INDEX idx_properties_location ON properties(location);

-- ✅ Index on booking_id for JOINs and WHERE queries
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);

-- ✅ Index on user_id in bookings table for user-booking relationship queries
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- ✅ Index on property_id in bookings table for property-booking relationship queries
CREATE INDEX idx_bookings_property_id ON bookings(property_id);



--After Indexing
EXPLAIN ANALYZE
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.user_id
WHERE users.email = 'sample@example.com';
