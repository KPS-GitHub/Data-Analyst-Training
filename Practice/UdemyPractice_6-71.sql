-- ======== UDEMY REAL WORLD PRACTICE PROBLEMS - 6-71 ========= -- 

-- Can you please give me a breakdown of what products are commonly purchased together, and any products that are rarely purchased together?

-- combine orderdetails and products tables so that we can compare the different types of products in each order
WITH prod_sales as (
    SELECT t1.productCode, orderNumber, productLine
    FROM orderdetails t1
    JOIN products t2
    ON t1.productCode = t2.productCode
)
-- select only the distinct lines that contain different products for product_one and product_two
-- -- explanation of use of LEAST() and GREATEST() in script below: making sure that we assign the LEAST() as product_one and GREATEST() as product_two filters out any cases of symmetrical duplicates (an order has one row having X as product_one and Y as product_two, but another row for the same order has Y as product_one and X as product_2, which would essentially be a duplicate of the first row)
SELECT DISTINCT 
    t1.orderNumber,
    LEAST(t1.productLine, t2.productLine) AS product_one,
    GREATEST(t1.productLine, t2.productLine) AS product_two
FROM prod_sales t1
JOIN prod_sales t2   -- same table joined with itself because each row of prod_sales is a different product but may be the same order as another row, so to compare the various products bought in each order, we must join the table with itself to produce rows that represent multiple different products for a single order
ON t1.orderNumber = t2.orderNumber AND t1.productLine <> t2.productLine;
