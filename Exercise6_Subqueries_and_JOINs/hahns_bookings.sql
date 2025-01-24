SELECT
	COUNT(*)
FROM
	(SELECT
		*
	FROM
		bookings AS b
	JOIN
		customers AS c
	ON 
		c.customer_id = b.customer_id
	WHERE
		c.last_name = 'Hahn') as "bc*";

	