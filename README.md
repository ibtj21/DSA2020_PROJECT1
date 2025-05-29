# DSA2040_PROJECT_1 : Retail Data Warehouse
## Table of Contents
- [Project Descreption](#project-descreption)  
- [Objective](#objective)  
- [Tools](#tools)  
- [Repository Contents](#repository-contents)
- [How to Use](#how-to-use)
- [Star Schema Design](#Star-Schema-Design)
- [Reflection & Discussion](#reflection--discussion)  
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
- Languages : SQL
- provided csv Files: dim_date.csv, dim_product.csv, dim_store.csv, fact_sales.csv

---

## Repository Contents
```
├── SQL_scripts
│ ├── schema.sql  : SQL script to create tables
│ ├── load_data.sql: SQL commands to load data from CSVs
│ └── queries.sql : SQL queries for analysis
├── data : Folder containing provided CSV files
│ ├── dim_date.csv
│ ├── dim_product.csv
│ ├── dim_store.csv
│ └── fact_sales.csv
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
## Star Schema Design

```
        +-------------+
        |  dim_date   |
        +-------------+
                     |
+-------------+     +-------------+     +-------------+
| dim_store   |-----| fact_sales  |-----| dim_product |
+-------------+     +-------------+     +-------------+
```

## Reflection & Discussion

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

- **Product Strategy:** Identifying best-performing product categories or top-selling items.  

  For example, the *Total Revenue by Product Category* query shows that Electronics generates significantly more revenue (7,500) compared to Footwear (400) and Apparel (560).


  | Category    | Total Revenue |
  |-------------|---------------|
  | Electronics | 7,500         |
  | Footwear    | 400           |
  | Apparel     | 560           |

  This insight suggests that the company could focus marketing efforts and inventory investment more on electronics to maximize profits.

---

- **Sales Planning:**  Analyzing monthly trends to forecast inventory and marketing needs.

   For example, the *Monthly Sales Trends* query reveals that January 2023 had the highest revenue (5,500), while March had the lowest (400).

  | Month | Year | Monthly Revenue |
  |-------|------|-----------------|
  | 1     | 2023 | 5,500           |
  | 2     | 2023 | 560             |
  | 3     | 2023 | 400             |
  | 4     | 2023 | 2,000           |

  This seasonal trend information can help the company forecast inventory needs and plan marketing campaigns strategically to boost sales during slower months.

---

- **Regional Performance:** Understanding which regions generate the most revenue to target promotions.
  
   For example, the *Revenue by Region* analysis indicates the Midwest region leads with 4,500 in revenue, followed by East and West.

  | Region  | Region Revenue |
  |---------|----------------|
  | Midwest | 4,500          |
  | East    | 3,400          |
  | West    | 560            |

  This data helps the company identify strong and weak markets, allowing targeted regional promotions or store expansions.

---

- **Store-Level Operations:**  Monitoring sales performance by store to optimize staffing, stock levels, and promotions.
  
   For example, insights from *Top Products by Quantity Sold* reveal that Jeans is the best-selling product, followed by Phones and Laptops.

  | Product Name | Total Quantity Sold |
  |--------------|---------------------|
  | Jeans        | 7                   |
  | Phone        | 5                   |
  | Laptop       | 5                   |
  | Shoes        | 4                   |

  Stores can optimize stocking and promotions based on such product popularity to meet customer demand and avoid overstocking less popular items.

---


---

## Collaborators / Team members
| Name                        | Student ID | GitHub Username                                 |
|-----------------------------|------------|--------------------------------------------------|
| Selmah Tzindori             | 669602     | [@SelmahT](https://github.com/SelmahT)           |
| Levin Ekuam                 | 669913     | [@LEVIN0](https://github.com/LEVIN0)             |
| Hana Hailemariam Gashaw    | 670555     | [@ibtj21](https://github.com/ibtj21)             |
| Ted Korir                  | 670340     | [@tk2814](https://github.com/tk2814)             |
| Trizah Nzioka              | 670074     | [@Trizah250000](https://github.com/Trizah250000) |
| Angela Irungu              | 669289     | [@Irungu05](https://github.com/Irungu05)         |

---

## License
This project is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and distribute this project with proper attribution.
