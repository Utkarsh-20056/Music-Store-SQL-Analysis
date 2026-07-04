# Music Store SQL Analysis

## Project Overview

This project demonstrates SQL skills by analyzing the Chinook (Music Store) database to solve real-world business problems.

The project covers SQL concepts from basic queries to advanced analytical techniques including joins, aggregate functions, subqueries, Common Table Expressions (CTEs), and window functions.

More than 50 SQL business questions were solved to extract meaningful business insights from the dataset.

---

## Tech Stack

- MySQL
- Python (Pandas & SQLAlchemy)
- SQL

---

## Database Setup

The repository includes everything required to recreate the database.

### Files

Database/
- 01_database_setup.sql
- 02_import_data.py
- 03_verify_database.sql
- 04_employee_fk.sql

### Steps

1. Run `01_database_setup.sql`
2. Temporarily drop the Employee self-referencing foreign key using `04_employee_fk.sql`
3. Update the MySQL credentials in `02_import_data.py`
4. Run `02_import_data.py`
5. Re-add the Employee foreign key
6. Verify the database using `03_verify_database.sql`

---

## SQL Topics Covered

- Basic SQL
- Filtering & Sorting
- Aggregate Functions
- GROUP BY & HAVING
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Business Case Studies

---

## Project Structure

```
Music_Store_SQL_Analysis
│
├── Database
│   ├── 01_database_setup.sql
│   ├── 02_import_data.py
│   ├── 03_verify_database.sql
│   └── 04_employee_fk.sql
│
├── 01_Basic_SQL.sql
├── 02_Aggregate_Functions.sql
├── 03_Joins.sql
├── 04_Subqueries.sql
├── 05_CTEs.sql
├── 06_Business_Case_Studies.sql
│
├── ER_Diagram.png
├── Business_Insights.md
└── README.md
```

---

## Business Questions Solved

Some examples include:

- Top spending customer
- Most popular music genre
- Highest revenue generating country
- Best selling album
- Top artists by sales
- Revenue by city
- Monthly revenue analysis
- Customer purchase behaviour
- Album sales ranking
- Genre performance analysis

---

## Key Business Insights

- USA generated the highest overall revenue.
- Prague recorded the highest revenue among all cities.
- Rock is the most purchased music genre.
- A small number of customers contribute a large share of revenue.
- Several artists consistently outperform others in total sales.

More insights are available in **Business_Insights.md**.

---

## Skills Demonstrated

- SQL Query Writing
- Data Analysis
- Relational Database Design
- Business Problem Solving
- Data Import using Python
- Database Management
- Data Validation
- Window Functions
- CTEs
- Query Optimization

---

## Dataset

This project uses the Chinook (Music Store) sample database for educational and portfolio purposes.
