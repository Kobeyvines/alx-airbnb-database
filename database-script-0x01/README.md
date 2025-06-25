## 🧾 Table Descriptions

- **`roles`**  
  Stores predefined user roles such as `guest`, `host`, and `admin`. Helps manage access levels and permissions across the platform.

- **`payment_methods`**  
  Contains available methods for making payments (e.g., `credit_card`, `paypal`, `stripe`). Ensures consistent and normalized payment options.

- **`booking_statuses`**  
  Defines the various stages a booking can go through (e.g., `pending`, `confirmed`, `canceled`). Useful for tracking booking progress.

- **`users`**  
  Central table storing user profile information. Each user is assigned a role and can act as a guest or host.

- **`properties`**  
  Represents listings added by hosts. Contains details like name, description, location, and nightly pricing.

- **`bookings`**  
  Tracks reservations made by users for properties, including booking dates, total price, and status.

- **`payments`**  
  Records payment transactions related to bookings, including method used and payment timestamp.

- **`messages`**  
  Captures direct messages exchanged between users (e.g., guest and host), facilitating communication within the platform.

- **`reviews`**  
  Stores user-generated reviews for properties, including a rating (1–5 stars) and optional comment.
