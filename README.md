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

