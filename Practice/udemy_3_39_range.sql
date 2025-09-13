-- 3-39 - range simple example

WITH order_vals AS (
	SELECT
		orderNumber,
		sum(quantityOrdered * priceEach) AS order_value
	FROM orderDetails
	GROUP BY orderNumber
)
SELECT 
	min(order_value) AS lowest_order_val,
    max(order_value) AS highest_order_val,
    (max(order_value) - min(order_value)) AS order_val_range,
    round(avg(order_value), 0) AS order_val_mean
FROM order_vals
;