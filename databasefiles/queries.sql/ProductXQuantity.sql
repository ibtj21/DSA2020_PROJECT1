-- Top Products by Quantity Sold
SELECT p.name, SUM(f.quantity_sold) AS total_quantity
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.name
ORDER BY total_quantity DESC;