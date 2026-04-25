# 🗄️ Event Management Database System

> A fully normalized relational database (3NF) for managing events, venues, bookings, sponsors, and programs — with complex SQL queries for reporting.

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=flat-square&logo=postgresql&logoColor=white)

---

## 📌 Project Overview

A structured relational database system designed to handle real-world event management scenarios. Built with proper normalization principles to eliminate data redundancy and ensure scalability.

---

## 🗃️ Database Schema

**5 Core Entities:**

| Table | Description |
|---|---|
| `Venues` | Stores location name, address, capacity |
| `Bookings` | Links events to venues with date & organizer info |
| `Programs` | Activities/sessions within each event |
| `Sponsors` | Sponsor name & contact details |
| `EventSponsors` | Junction table for many-to-many sponsor ↔ event relationship |

---

## 🔗 Relationships

```
Venues (1) ──────── (M) Bookings
Bookings (1) ───────(M) Programs
Bookings (M) ───────(M) Sponsors  [via EventSponsors]
```

---

## 🧠 SQL Highlights

- Complex JOIN queries across 5 tables
- One-to-many and many-to-many relationships
- Aggregation and reporting queries
- Full 3NF normalization

---

## 🗂️ Project Structure

```
event-management-db/
│
├── schema/
│   └── create_tables.sql          # Table creation with constraints
│
├── data/
│   └── sample_data.sql            # Insert statements with sample records
│
├── queries/
│   ├── reporting_queries.sql      # Joins, aggregations, filters
│   └── complex_queries.sql        # Multi-table queries
│
├── er_diagram.png                 # Entity-Relationship diagram
└── README.md
```

---

## 🚀 How to Run

```sql
-- Step 1: Create the database
CREATE DATABASE event_management;
USE event_management;

-- Step 2: Run schema
SOURCE schema/create_tables.sql;

-- Step 3: Load sample data
SOURCE data/sample_data.sql;

-- Step 4: Run queries
SOURCE queries/reporting_queries.sql;
```

---

*Built by [Krisha Shah](https://www.linkedin.com/in/krishas7) · Mumbai, India*
