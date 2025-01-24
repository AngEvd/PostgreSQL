SELECT
	b.booking_id,
	DATE(b.starts_at) as starts_at,
	b.apartment_id,
	concat(c.first_name, ' ', c.last_name) AS customer_name
FROM
	bookings AS b
RIGHT JOIN
	customers AS c
ON
	c.customer_id = b.customer_id
ORDER BY
	customer_name
LIMIT 10;