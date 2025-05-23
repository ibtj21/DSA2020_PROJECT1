
COPY dim_date FROM 'C:\datawarehousing\dim_date.csv' DELIMITER ',' CSV HEADER;
COPY dim_product FROM 'C:\datawarehousing\dim_product.csv' DELIMITER ',' CSV HEADER;
COPY dim_store FROM 'C:\datawarehousing\dim_store.csv' DELIMITER ',' CSV HEADER;
COPY fact_sales FROM 'C:\datawarehousing\fact_sales.csv' DELIMITER ',' CSV HEADER;
