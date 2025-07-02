# Index Performance Analysis – Airbnb Clone Database

## 🎯 Objective
Identify high-usage columns in the **User**, **Booking**, and **Property** tables and create appropriate indexes to optimize query performance.

---

## 🔍 Identified High-Usage Columns

| Table       | Column        | Usage Context                 |
|-------------|---------------|-------------------------------|
| users       | user_id       | JOIN, WHERE                  |
| users       | email         | WHERE (login lookup)         |
| bookings    | booking_id    | JOIN, WHERE                  |
| bookings    | user_id       | JOIN, WHERE                  |
| bookings    | property_id   | JOIN, WHERE                  |
| properties  | property_id   | JOIN, WHERE                  |
| properties  | location      | WHERE, ORDER BY              |

---

## 🛠️ Created Indexes

- **Users Table**
  - `user_id` for JOINs and WHERE clauses
  - `email` for login and user lookup

- **Properties Table**
  - `property_id` for JOINs and WHERE clauses
  - `location` for WHERE and ORDER BY filters

- **Bookings Table**
  - `booking_id` for JOINs and WHERE clauses
  - `user_id` for user-booking relationship queries
  - `property_id` for property-booking relationship queries

---

## ⚡ Performance Measurement

### Before Adding Indexes

- Queries such as joining **users** and **bookings** on `user_id` and filtering by `email` have **higher query cost** and **longer execution time** due to full table scans.

Example:

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.user_id
WHERE users.email = 'sample@example.com';
