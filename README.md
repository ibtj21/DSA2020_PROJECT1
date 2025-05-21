# DataWarehousing and mining(Project 001)
## Retail sales data warehousing project
## Table of Contents
1. [Project Overview](#project-overview)
2. [Objective](#objective)
3. [Tools & Technologies](#tools--technologies)
4. [Star Schema Design](#star-schema-design)
5. [Project Structure](#project-structure)
6. [How to Run](#how-to-run)
7. [Key Analytical Queries & Insights](#key-analytical-queries--insights)
8. [Reflection & Discussion](#reflection--discussion)
9. [Collaborators](#collaborators)
10. [License](#license)
---
### Project Overview
- This project involves designing and building a star schema-based data warehouse for a retail company to analyze sales data across products, stores, and time periods. Using PostgreSQL, we created dimension and fact tables, loaded CSV data, and ran analytical queries to extract meaningful business insights.
---
### Objective
- Design a star schema data warehouse.
- Load CSV data into PostgreSQL.
- Run SQL queries to analyze sales data.
- Reflect on design choices and business impact.
---
### Tools & Technologies
- DBMS: PostgreSQL (version 17)
- SQL Client: pgAdmin
- Languages: SQL
- Data Files: dim_date.csv, dim_product.csv, dim_store.csv, fact_sales.csv
---
## Star Schema Design
The data warehouse schema consists of:  
- **Fact Table**  
  - `fact_sales`: Records individual sales including references to date, product, and store dimensions.  
- **Dimension Tables**  
  - `dim_date`: Contains attributes of dates (date_id, full_date, day, month, quarter, year).  
  - `dim_product`: Contains product details (product_id, name, category, brand).  
  - `dim_store`: Contains store details (store_id, store_name, city, region).

---
## Project Structure 
```
/project-root
│
├── schema.sql # SQL script to create tables
├── data/ # Folder containing CSV files
│ ├── dim_date.csv
│ ├── dim_product.csv
│ ├── dim_store.csv
│ └── fact_sales.csv
├── queries.sql # SQL queries for analysis
└── README.md # This documentation file
```
---

---

## How to Run  
1. Install PostgreSQL and pgAdmin.  
2. Create a new database, e.g., `retail_dw`.  
3. Execute `schema.sql` to create the required tables.  
4. Use `Copy` commands in pgAdmin or psql to import CSV data into each table.  
5. Run queries from `queries.sql` to generate business reports.

---

## Key Analytical Queries & Insights  

- **Total Revenue by Product Category**
- This analysis helps identify which product categories contribute most to overall revenue.
  ```sql
  SELECT p.category, SUM(f.revenue) AS total_revenue
  FROM fact_sales f
  JOIN dim_product p ON f.product_id = p.product_id
  GROUP BY p.category;
 - **Results**
```
category	total_revenue

Electronics	7500

Footwear	  400

Apparel	    560
```
 Insight: Electronics is the top-performing category by a significant margin, suggesting a focus area for marketing or inventory planning.
