# 📦 `seed.sql` – Sample Data for Airbnb Clone Database

This `seed.sql` file provides sample `INSERT` statements to populate the Airbnb Clone database with realistic data. It complements the normalized database schema by helping developers quickly test or demonstrate the application's functionality.

---

## 🚀 What's Included

The seed data covers:

- ✅ **Roles**: `guest`, `host`, `admin`
- 💳 **Payment Methods**: `credit_card`, `paypal`, `stripe`
- 📦 **Booking Statuses**: `pending`, `confirmed`, `cancelled`
- 👤 **Users**: realistic guest, host, and admin profiles
- 🏠 **Properties**: listings hosted by users
- 📅 **Bookings**: bookings made by guests
- 💰 **Payments**: linked to bookings using defined payment methods
- 💬 **Messages**: communication between guest and host
- ⭐ **Reviews**: feedback left by guests for properties

---

## 📋 Sample Data Overview

### 👤 Users

| user_id | Name            | Email              | Role  |
|---------|-----------------|--------------------|-------|
| `u1`    | Alice Wonder    | alice@example.com  | guest |
| `u2`    | Bob Builder     | bob@example.com    | host  |
| `u3`    | Clara Admin     | clara@example.com  | admin |

---

### 🏠 Properties

| property_id | Host         | Name         | Location        | Price/Night |
|-------------|--------------|--------------|------------------|-------------|
| `p1`        | Bob Builder  | Sunny Loft   | Nairobi, Kenya   | 55.00       |
| `p2`        | Bob Builder  | Cozy Cottage | Naivasha, Kenya  | 75.00       |

---

### 📅 Bookings

| booking_id | Guest         | Property     | Dates              | Status     | Total Price |
|------------|---------------|--------------|--------------------|------------|-------------|
| `b1`       | Alice Wonder  | Sunny Loft   | Jul 1 – Jul 3, 2025| confirmed  | 110.00      |
| `b2`       | Alice Wonder  | Cozy Cottage | Aug 10 – Aug 13, 2025| pending  | 225.00      |

---

### 💳 Payments

| payment_id | Booking | Amount | Method     | Date                |
|------------|---------|--------|------------|---------------------|
| `pay1`     | b1      | 110.00 | PayPal     | (current timestamp) |
| `pay2`     | b2      | 225.00 | Credit Card| (current timestamp) |

---

### 💬 Messages

| message_id | Sender        | Recipient     | Message                                      |
|------------|---------------|---------------|----------------------------------------------|
| `m1`       | Alice Wonder  | Bob Builder   | "Hi, is the Sunny Loft available early check-in?" |
| `m2`       | Bob Builder   | Alice Wonder  | "Yes! You can check in by 11 AM."           |

---

### ⭐ Reviews

| review_id | Property       | User          | Rating | Comment                            |
|-----------|----------------|---------------|--------|-------------------------------------|
| `r1`      | Sunny Loft     | Alice Wonder  | 5      | "Great stay! Clean and well-located." |
| `r2`      | Cozy Cottage   | Alice Wonder  | 4      | "Nice place but a bit far from town." |

---

## 🛠️ How to Use

### ✅ Requirements

- MySQL 8.x (or compatible)
- Airbnb schema from `schema.sql` already created

### ▶️ To Run

Option 1 — Command line:
```bash
mysql -u your_user -p your_database < seed.sql
