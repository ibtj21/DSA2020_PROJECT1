# DSA2040_PROJECT_1 : Retail Data Warehouse
## Table of Contents
- [Project Descreption](#project-descreption)  
- [Objective](#objective)  
- [Tools](#tools)  
- [Contents](#contents)  
- [How to Use](#how-to-use)  
- [Key Analytical Queries & Insights](#key-analytical-queries--insights)  
- [Reflection & Discussion Questions](#reflection--discussion-questions)  
- [Collaborators / Team members](#collaborators--team-members)  
- [License](#license)  
  
### Project Descreption
- This project builds a mini datawarehouse for a fictional retail company to analyze sales performance by product , store , and time.

---

### Objective
- Design a star schema data warehouse.  
- Load data from the provided csv files.  
- Run analytical queries to gain business insights.

---

### Tools 
- DBMS: PostgreSQL (version 17)  
- SQL Client: pgAdmin  
- Languages: SQL  
- provided csv Files: dim_date.csv, dim_product.csv, dim_store.csv, fact_sales.csv

---

## Contents
```
/project-root
│
├── schema.sql  : SQL script to create tables
├── data : Folder containing provided CSV files
│ ├── dim_date.csv
│ ├── dim_product.csv
│ ├── dim_store.csv
│ └── fact_sales.csv
├── queries.sql : SQL queries for analysis
├── load_data.sql: SQL commands to load data from CSVs
├── queries_results: Exported CSV files, which are the result of the query
├── README.md : This documentation file
└── License
```   

---

## How to use  
1. Setup a postgresql database  and pgAdmin client.  
2. Create a new database, e.g., `retail_dw`.  
3. Execute `schema.sql` to create the schema.  
4. Load CSV data using 'load_data.sql'.  
5. Run queries from `queries.sql` to analyze.

---

## Key Analytical Queries & Insights  

**Total Revenue by Product Category**  
- This analysis helps identify which product categories contribute most to overall revenue.
```sql
SELECT p.category, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category;
```
**Results**
```
category    total_revenue
Electronics  7500
Footwear     400
Apparel      560
```
- *Insight*: Electronics is the top-performing category by a significant margin, suggesting a focus area for marketing or inventory planning.

---

**Monthly Sales Trends**  
This query tracks revenue trends across months in 2023.
```sql
SELECT d.month, d.year, SUM(f.revenue) AS monthly_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
```
**Results**
```
month  year  monthly_revenue
1      2023  5500
2      2023  560
3      2023  400
4      2023  2000
```
- *Insight*: January had the highest revenue, while March saw the lowest.

---

**Revenue by Region**  
Shows how revenue is distributed across different regions.
```sql
SELECT s.region, SUM(f.revenue) AS region_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.region;
```
**Results**
```
region   region_revenue
Midwest  4500
East     3400
West     560
```
- *Insight*: The Midwest region leads in revenue, indicating strong performance or demand.

---

**Top Products by Quantity Sold**  
- Identifies the products with the highest sales volume.
```sql
SELECT p.name, SUM(f.quantity_sold) AS total_quantity
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.name
ORDER BY total_quantity DESC;
```
**Results**
```
Product Name  Total Quantity Sold
Jeans         7
Phone         5
Laptop        5
Shoes         4
```
- *Insight*: Jeans had the highest quantity sold, suggesting it’s a popular item across regions.

---

## Reflection & Discussion Questions

- *Why use a star schema instead of a normalized schema?*
```
- The star schema is preferred in data warehousing for its simplicity and efficiency. Unlike a highly normalized schema, which involves many joined tables, a star schema:
     - Uses fewer joins for queries, leading to faster performance.
     - Organizes data in a way that is easy to understand for business users and analysts.
     - Supports clear relationships between fact and dimension tables, making analysis more straightforward.
- This structure is ideal for analytical workloads and reporting
```

- *What are the benefits of separating facts from dimensions?*
```
- Separating facts from dimensions allows for:
     - Clear distinction between measurable data (facts) like revenue and quantity sold, and descriptive context (dimensions) like product category or store location.
     - Reusability: Dimension tables (e.g., dim_product) can be referenced by multiple fact tables without duplication.
     - Data consistency: Ensures consistent lookups and avoids redundancy across analytical reports.
     - Scalability: It's easier to expand dimensions or add new facts without redesigning the whole schema.
```

- *What types of business decisions could this warehouse support?*
```
- This data warehouse supports data-driven decisions such as:
      - Product strategy: Identifying best-performing product categories or top-selling items.
      - Sales planning: Analyzing monthly trends to forecast inventory and marketing needs.
      - Regional performance: Understanding which regions generate the most revenue to target promotions.
      - Store-level operations: Monitoring sales performance by store to optimize staffing, stock levels, and promotions.
- These insights help stakeholders make informed, evidence-based business decisions
```

---

## Collaborators / Team members
| Name                        | Student ID | GitHub Username                                 |
|-----------------------------|------------|--------------------------------------------------|
| Selmah Tzindori             | 669602     | [@SelmahT](https://github.com/SelmahT)           |
| Levin Ekuam                 | 669913     | [@LEVINO](https://github.com/LEVINO)             |
| Hana Hailemariam Gashaw    | 670555     | [@ibtj21](https://github.com/ibtj21)             |
| Ted Korir                  | 670340     | [@tk2814](https://github.com/tk2814)             |
| Trizah Nzioka              | 670074     | [@Trizah250000](https://github.com/Trizah250000) |
| Angela Irungu              | 669289     | [@Irungu05](https://github.com/Irungu05)         |

---

## License
This project is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and distribute this project with proper attribution.
