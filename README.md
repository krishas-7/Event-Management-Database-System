# 🗄️ Event Management Database System

> A fully normalized (3NF) relational database for managing events, venues, bookings, sponsors, and programs — with complex SQL queries covering one-to-many and many-to-many relationships.

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=flat-square&logo=postgresql&logoColor=white)

---

## 📌 Project Overview

A structured relational database system to handle real-world event management scenarios. Built with proper normalization to eliminate data redundancy and ensure scalability across 5 core entities with clearly defined relationships.

---

## 🗃️ Database Schema — 5 Core Tables

### Venues
| Column | Type | Description |
|---|---|---|
| VenueID | INT PK | Unique venue identifier |
| VenueName | VARCHAR(100) | Name of the venue |
| Location | VARCHAR(100) | Address |
| Capacity | INT | Max attendee capacity |

### Bookings
| Column | Type | Description |
|---|---|---|
| BookingID | INT PK | Unique booking identifier |
| VenueID | INT FK | References Venues |
| EventDate | DATE | Date of the event |
| BookedBy | VARCHAR(100) | Organizer name |
| Status | VARCHAR(50) | Confirmed / Pending / Cancelled |

### Sponsors
| Column | Type | Description |
|---|---|---|
| SponsorID | INT PK | Unique sponsor identifier |
| SponsorName | VARCHAR(100) | Sponsor company name |
| ContactInfo | VARCHAR(100) UNIQUE | Email contact |

### Programs
| Column | Type | Description |
|---|---|---|
| ProgramID | INT PK | Unique program identifier |
| BookingID | INT FK | References Bookings |
| ProgramName | VARCHAR(100) | Activity name |
| StartTime | TIME | Program start time |
| Duration | INT | Duration in minutes |

### EventSponsors (Junction Table)
| Column | Type | Description |
|---|---|---|
| BookingID | INT FK | References Bookings |
| SponsorID | INT FK | References Sponsors |
| (BookingID, SponsorID) | PK | Composite primary key |

---

## 🔗 Relationships

```
Venues (1) ──────────── (M) Bookings
Bookings (1) ──────────── (M) Programs
Bookings (M) ──────────── (M) Sponsors  [via EventSponsors]
```

- **One venue** can have **multiple bookings**
- **One booking** can have **multiple programs**
- **One booking** can have **multiple sponsors** and **one sponsor** can support **multiple bookings**

---

## 📊 Sample Data

**10 Venues** — Grand Auditorium (500), City Hall (300), Convention Center (1000), Outdoor Stadium (2000), and 6 more

**10 Bookings** — Mix of Confirmed, Pending, and Cancelled statuses across Nov–Dec 2024

**10 Sponsors** — Tech Innovations, Music Lovers, Artistry Co., Culinary Delight, and 6 more

**10 Programs** — Keynote Speech, Panel Discussion, Live Music, Art Exhibition, and 6 more

---

## 🧠 SQL Queries Included

| Query | Description |
|---|---|
| 1 | View all 5 tables |
| 2 | All confirmed bookings with venue details |
| 3 | Programs with booking and venue info |
| 4 | Sponsors per event (many-to-many JOIN) |
| 5 | Number of bookings per venue |
| 6 | Total programs and duration per booking |
| 7 | High-capacity venues (>500) with bookings |
| 8 | Bookings with no sponsor assigned |
| 9 | Sponsors supporting multiple events |
| 10 | Full event report — venue + programs + sponsors |

---

## 🗂️ Repository Structure

```
event-management-db/
│
├── schema.sql          # CREATE TABLE statements (5 tables)
├── sample_data.sql     # INSERT statements (10 records per table)
├── queries.sql         # 10 reporting & analysis queries
└── README.md
```

---

## 🚀 How to Run

```sql
-- Step 1: Create and select database
CREATE DATABASE event_management;
USE event_management;

-- Step 2: Create tables
SOURCE schema.sql;

-- Step 3: Insert sample data
SOURCE sample_data.sql;

-- Step 4: Run queries
SOURCE queries.sql;
```

Or copy-paste each file directly into **MySQL Workbench**.

---

## 💡 Key Concepts Demonstrated

- **3NF Normalization** — no redundancy, proper data integrity
- **Primary & Foreign Keys** — enforcing relational constraints
- **One-to-Many** relationships (Venues → Bookings, Bookings → Programs)
- **Many-to-Many** relationship (Bookings ↔ Sponsors via EventSponsors)
- **Complex JOINs** — multi-table queries across 4-5 tables
- **Aggregation** — COUNT, SUM, GROUP BY, HAVING
- **LEFT JOIN** — finding records with missing relationships

---

*Built by [Krisha Shah](https://www.linkedin.com/in/krishas7) · Mumbai, India*
