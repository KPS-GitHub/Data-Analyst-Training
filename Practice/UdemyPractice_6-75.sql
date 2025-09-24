-- ========== UdemyPractice_6-75 ============

-- We have discovered that shipping is delayed due to the weather, and it's possible they will take up to 3 days to arrive. Can you get me a list of affected orders?

-- query strategy: flag all orders that would arrive late (after requiredDate) with the 3 day delay and return those flagged orders
WITH with_late_flag AS (
SELECT *,
	DATE_ADD(shippedDate, interval 3 day) AS latestArrival,
    CASE 
		WHEN DATE_ADD(shippedDate, interval 3 day) > requiredDate THEN 1 ELSE 0 END
		AS lateFlag 
FROM orders
) 
SELECT *
FROM with_late_flag
WHERE lateFlag = 1
;