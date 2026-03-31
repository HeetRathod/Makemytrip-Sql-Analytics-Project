# MakeMyTrip SQL Project

**End-to-end SQL project simulating a travel booking platform — covering hotel bookings, flight reservations, payments, cancellations, and refunds.**

---

## Project Title
 JourneyIQ: Business Analytics System for MakeMyTrip

---

## Brief One Line Summary
Designed and queried a relational database for a travel platform to analyze bookings, revenue, customer behavior, and flight data using advanced SQL.

---

## Overview

I wanted to work on something that felt close to a real-world backend — not just basic CRUD queries. So I modeled the MakeMyTrip platform from scratch. The database has 9 tables covering customers, hotels, flights, bookings, payments, reviews, cancellations, and refunds. On top of the schema, I wrote 12 queries ranging from simple joins to window functions, CTEs, stored procedures, triggers, and views. The goal was to cover the kind of SQL work that actually comes up in data analyst and backend roles.

---

## Problem Statement

Travel platforms deal with a lot of moving parts — customer data, hotel inventory, flight schedules, payment modes, post-trip reviews, and cancellation workflows. Managing and analyzing all of this through SQL is a common real-world requirement. I wanted to practice building that kind of system end to end — not just write a few select statements, but actually design the schema, handle relationships, and then answer business questions from the data.

---

## Dataset

This is a self-created dataset — all records were manually inserted to simulate realistic booking scenarios.

| Table | Description |
|---|---|
| `customers` | 10 customers across Indian cities |
| `hotels` | 10 hotels with ratings and pricing |
| `bookings` | Hotel booking records with check-in/check-out and amounts |
| `payments` | Payment mode and amount per booking |
| `reviews` | Post-stay ratings and review text |
| `flights` | 5 flight records across Indian routes |
| `flight_bookings` | Customer flight booking records |
| `cancellations` | Cancelled hotel and flight bookings with reasons |
| `refunds` | Refund status and amounts tied to cancellations |

---

## Tools and Technologies

- MySQL — database creation, all queries, procedures, triggers
- MySQL Workbench — writing and testing SQL
- SQL concepts used: Joins, CTEs, Window Functions, Stored Procedures, Triggers, Views, Indexes, ENUM, Foreign Keys

---

## Methods

Started by designing the schema — figured out what tables were needed and how they'd relate to each other. Customers connect to both hotel bookings and flight bookings. Bookings connect to payments and reviews. Cancellations connect to refunds. Once the relationships were clear, I created all tables with proper primary and foreign keys, then inserted realistic sample data.

After the schema was set, I wrote queries to answer specific business questions:
- Revenue analysis using GROUP BY and JOINs
- Customer ranking using CTEs + RANK() window function
- Running revenue over time using SUM() OVER
- Churn detection using DATEDIFF and CASE
- A booking audit trigger that auto-logs every new booking
- Stored procedures for revenue by date range, customer history, and flight revenue
- A view for clean business reporting without exposing raw tables
- Indexes on booking_date and customer_id to improve query performance

---

## Key Insights

- Oberoi Mumbai and Taj Palace came out as top revenue generators among all hotels
- Top 3 customers by spend were identified using a CTE + RANK() — useful for loyalty programs
- Running revenue showed a steady climb through July and August 2023
- UPI was the most frequently used payment mode across bookings
- Two cancellations were recorded — one hotel, one flight — with one refund still pending
- Customers with no bookings in the last 60 days were flagged as churn risk using DATEDIFF logic

---

## Dashboard / Output

No visual dashboard for this one — the output is entirely SQL-based.

Key query outputs:
- `Total Revenue per Hotel` — ranked list of hotels by earnings
- `Top 3 Customers by Spending` — with spend rank
- `Running Revenue Over Time` — cumulative sum by booking date
- `Average Rating per Hotel` — joined from reviews and bookings
- `Customer Churn Indicator` — ACTIVE vs CHURN_RISK per customer
- `v_booking_summary` — view combining customer, hotel, and booking data
- `booking_audit` table — auto-populated by trigger on every new booking insert

---

## How to Run this Project?

1. Make sure MySQL is installed — [Download here](https://dev.mysql.com/downloads/)
2. Clone or download this repo
3. Open `makemytrip_project.sql` in MySQL Workbench or any SQL client
4. Run the full file from top to bottom — it creates the database, tables, inserts data, and runs all queries
5. Individual queries are clearly commented so you can run them one at a time if needed

> Everything runs on a local MySQL instance. No external data source or connection needed.

---

## Results & Conclusion

This project gave me solid practice on things I'd been wanting to get comfortable with — especially window functions, stored procedures, and triggers, which don't come up in basic SQL tutorials. Building the schema from scratch also helped me think more carefully about normalization and how foreign keys affect query design. The churn detection and audit trigger felt the most practical — those are patterns that actually show up in production databases.

---

## Future Work

- Add a `cab_bookings` table to make it more complete as a travel platform
- Write more complex analytical queries — month-over-month revenue, hotel occupancy rate
- Connect the database to a Python script for automated reporting
- Build a simple Power BI or Tableau dashboard on top of the query outputs

---

## Author & Contact

**Heet Rathod**
- Email: heetrathod9802@gmail.com
- LinkedIn: www.linkedin.com/in/heetrathod9802
- GitHub: https://github.com/HeetRathod
