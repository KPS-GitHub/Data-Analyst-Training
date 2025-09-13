-- udemy 2-36 - Date Functions
-- YEAR(dateCol), MONTH(dateCol), DAY(dateCol), NOW(), DATEDIFF(date1, date2), DATE_ADD(dateCol), DATE_SUB(dateCol)

SELECT
	orderNumber,
    orderDate,
    YEAR(orderDate) AS year,
    MONTH(orderDate) AS month,
    DAY(orderDate) AS day,
    NOW() AS now_date,
    DATEDIFF(orderDate, NOW()) AS dateDiff_ordNow,
    DATEDIFF(NOW(), orderDate) AS dateDiff_nowOrd,
    DATEDIFF(NOW(), requiredDate) AS dateDiff_daysUntilReqd,
    DATE_ADD(requiredDate, INTERVAL 20 YEAR) AS dateAdd_20YearAfterReqd,
    DATE_SUB(requiredDate, INTERVAL 20 YEAR) AS dateSub_20YearAfterReqd,
    DATEDIFF(NOW(), DATE_ADD(requiredDate, INTERVAL 20 YEAR)) AS dateDiff_now_25YrAfterReqd
FROM orders
;