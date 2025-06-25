# 🧼 Normalized Airbnb Clone ERD (3NF)

This document presents the normalized version of the Airbnb clone database schema. The normalization process brings the database into **Third Normal Form (3NF)** to reduce redundancy and improve data integrity.

---

## 🛠️ Steps Taken to Normalize

### ✅ First Normal Form (1NF)
- Ensured all attributes are atomic (no lists or nested fields).
- Each record has a unique primary key.

### ✅ Second Normal Form (2NF)
- Ensured that all non-key columns are fully dependent on the entire primary key.
- Since all tables use single-column primary keys, this condition is already met.

### ✅ Third Normal Form (3NF)
- Removed transitive dependencies:
  - Replaced ENUM fields (`role`, `status`, `payment_method`) with lookup/reference tables.
  - This improves maintainability and enforces referential integrity.

---

## 📄 Table: `roles`

| Column     | Type      | Description             |
|------------|-----------|-------------------------|
| role_id    | UUID (PK) | Unique identifier       |
| role_name  | VARCHAR   | guest, host, admin      |

## 📄 Table: `payment_methods`

| Column      | Type      | Description             |
|-------------|-----------|-------------------------|
| method_id   | UUID (PK) | Unique identifier       |
| method_name | VARCHAR   | credit_card, paypal, etc |

## 📄 Table: `booking_statuses`

| Column     | Type      | Description               |
|------------|-----------|---------------------------|
| status_id  | UUID (PK) | Unique identifier         |
| status_name| VARCHAR   | pending, confirmed, etc   |

## 📄 Table: `users`

| Column         | Type      | Description                         |
|----------------|-----------|-------------------------------------|
| user_id        | UUID (PK) | Unique user ID                      |
| first_name     | VARCHAR   | First name                          |
| last_name      | VARCHAR   | Last name                           |
| email          | VARCHAR   | Unique email                        |
| password_hash  | VARCHAR   | Hashed password                     |
| phone_number   | VARCHAR   | Optional phone number               |
| role_id        | UUID (FK) | References `roles(role_id)`         |
| created_at     | TIMESTAMP | Account creation time               |

## 🏠 Table: `properties`

| Column         | Type      | Description                          |
|----------------|-----------|--------------------------------------|
| property_id    | UUID (PK) | Unique property ID                   |
| host_id        | UUID (FK) | References `users(user_id)`          |
| name           | VARCHAR   | Property name                        |
| description    | TEXT      | Property description                 |
| location       | VARCHAR   | Location string                      |
| price_per_night| DECIMAL   | Cost per night                       |
| created_at     | TIMESTAMP | Property creation timestamp          |
| updated_at     | TIMESTAMP | Last updated timestamp               |

## 📅 Table: `bookings`

| Column         | Type      | Description                           |
|----------------|-----------|---------------------------------------|
| booking_id     | UUID (PK) | Unique booking ID                     |
| property_id    | UUID (FK) | References `properties(property_id)`  |
| user_id        | UUID (FK) | References `users(user_id)`           |
| start_date     | DATE      | Booking start date                    |
| end_date       | DATE      | Booking end date                      |
| total_price    | DECIMAL   | Total cost of booking                 |
| status_id      | UUID (FK) | References `booking_statuses(status_id)` |
| created_at     | TIMESTAMP | Timestamp of booking creation         |

## 💳 Table: `payments`

| Column         | Type      | Description                          |
|----------------|-----------|--------------------------------------|
| payment_id     | UUID (PK) | Unique payment ID                    |
| booking_id     | UUID (FK) | References `bookings(booking_id)`    |
| amount         | DECIMAL   | Amount paid                          |
| payment_date   | TIMESTAMP | Payment timestamp                    |
| method_id      | UUID (FK) | References `payment_methods(method_id)` |

## 💬 Table: `messages`

| Column         | Type      | Description                          |
|----------------|-----------|--------------------------------------|
| message_id     | UUID (PK) | Unique message ID                    |
| sender_id      | UUID (FK) | References `users(user_id)`          |
| recipient_id   | UUID (FK) | References `users(user_id)`          |
| message_body   | TEXT      | Message content                      |
| sent_at        | TIMESTAMP | Message timestamp                    |

## ⭐ Table: `reviews`

| Column         | Type      | Description                          |
|----------------|-----------|--------------------------------------|
| review_id      | UUID (PK) | Unique review ID                     |
| property_id    | UUID (FK) | References `properties(property_id)` |
| user_id        | UUID (FK) | References `users(user_id)`          |
| rating         | INTEGER   | Rating from 1 to 5                   |
| comment        | TEXT      | Review comment                       |
| created_at     | TIMESTAMP | When the review was written          |

---

## 🔗 Relationships Summary

- `users` → `roles` (M:1)
- `users` → `properties` (1:M)
- `users` → `bookings` (1:M)
- `users` → `messages` (1:M as sender and recipient)
- `users` → `reviews` (1:M)
- `properties` → `bookings` (1:M)
- `properties` → `reviews` (1:M)
- `bookings` → `payments` (1:1)
- `bookings` → `booking_statuses` (M:1)
- `payments` → `payment_methods` (M:1)
