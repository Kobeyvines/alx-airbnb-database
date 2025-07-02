# 📝 Partitioning Performance Report – Airbnb Clone Bookings Table

## 🎯 Objective
Optimize query performance on the **bookings table** by implementing **table partitioning** based on the `start_date` column to efficiently handle large datasets.

---

## 🔧 Implementation Summary

- **Partitioning Type:** RANGE partitioning
- **Partition Key:** `start_date`
- **Partitions Created:**
  - `bookings_2024` for bookings from **2024-01-01 to 2025-01-01**
  - `bookings_2025` for bookings from **2025-01-01 to 2026-01-01**
  - `bookings_future` for bookings from **2026-01-01 to 2030-01-01**

---

## ⚡ Performance Testing

### **Test Scenario**
Fetching bookings within **July 2025**:

- **Query:**  
  Retrieve all bookings with `start_date` between **2025-07-01 and 2025-07-31**.

- **Tools Used:**  
  `EXPLAIN ANALYZE` to measure execution plan and query cost.

---

### **Observations**

✅ **Before Partitioning:**  
- Full table scan on the **entire bookings table**.  
- **Higher execution time** as data volume increases.

✅ **After Partitioning:**  
- Query used **partition pruning**, scanning only relevant partitions (`bookings_2025`).  
- **Reduced I/O operations** and improved execution time.

---

## ✅ Conclusion

Table partitioning significantly **improved query performance** for date-range queries in the bookings table by:

- Reducing the data scanned per query  
- Improving response time for analytics and backend operations  
- Enhancing scalability for future growth of the database

---

**Recommendation:**  
Adopt table partitioning for **time-series tables** such as bookings, payments, and logs in production environments to ensure optimal database performance as datasets grow.

---
