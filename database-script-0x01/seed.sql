-- 🎭 Roles
INSERT INTO roles (role_id, role_name)
VALUES
  (UUID(), 'guest'),
  (UUID(), 'host'),
  (UUID(), 'admin');

-- 💳 Payment Methods
INSERT INTO payment_methods (method_id, method_name)
VALUES
  (UUID(), 'credit_card'),
  (UUID(), 'paypal'),
  (UUID(), 'stripe');

-- 📦 Booking Statuses
INSERT INTO booking_statuses (status_id, status_name)
VALUES
  (UUID(), 'pending'),
  (UUID(), 'confirmed'),
  (UUID(), 'cancelled');

-- 👤 Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role_id, created_at)
VALUES
  ('u1', 'Alice', 'Wonder', 'alice@example.com', 'hashed_pw1', '1234567890', 
   (SELECT role_id FROM roles WHERE role_name = 'guest'), NOW()),
  ('u2', 'Bob', 'Builder', 'bob@example.com', 'hashed_pw2', '9876543210', 
   (SELECT role_id FROM roles WHERE role_name = 'host'), NOW()),
  ('u3', 'Clara', 'Admin', 'clara@example.com', 'hashed_pw3', NULL, 
   (SELECT role_id FROM roles WHERE role_name = 'admin'), NOW());

-- 🏡 Properties
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
  ('p1', 'u2', 'Sunny Loft', 'A bright loft in the city center.', 'Nairobi, Kenya', 55.00, NOW(), NOW()),
  ('p2', 'u2', 'Cozy Cottage', 'Perfect for a weekend getaway.', 'Naivasha, Kenya', 75.00, NOW(), NOW());

-- 📅 Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status_id, created_at)
VALUES
  ('b1', 'p1', 'u1', '2025-07-01', '2025-07-03', 110.00, 
   (SELECT status_id FROM booking_statuses WHERE status_name = 'confirmed'), NOW()),
  ('b2', 'p2', 'u1', '2025-08-10', '2025-08-13', 225.00, 
   (SELECT status_id FROM booking_statuses WHERE status_name = 'pending'), NOW());

-- 💰 Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_date, method_id)
VALUES
  ('pay1', 'b1', 110.00, NOW(), 
   (SELECT method_id FROM payment_methods WHERE method_name = 'paypal')),
  ('pay2', 'b2', 225.00, NOW(), 
   (SELECT method_id FROM payment_methods WHERE method_name = 'credit_card'));

-- 💬 Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('m1', 'u1', 'u2', 'Hi, is the Sunny Loft available early check-in?', NOW()),
  ('m2', 'u2', 'u1', 'Yes! You can check in by 11 AM.', NOW());

-- ⭐ Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('r1', 'p1', 'u1', 5, 'Great stay! Clean and well-located.', NOW()),
  ('r2', 'p2', 'u1', 4, 'Nice place but a bit far from town.', NOW());
