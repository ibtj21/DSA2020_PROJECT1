

-- Revenue by Region
SELECT s.region, SUM(f.revenue) AS region_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.region;

