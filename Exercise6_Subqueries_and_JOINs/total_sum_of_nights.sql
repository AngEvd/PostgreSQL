SELECT
	name,
	SUM(booked_for)
FROM
	(SELECT
		a.name,
		b.booked_for
	FROM
		apartments AS a
	JOIN
		bookings AS b
	ON
		b.apartment_id = a.apartment_id) as nbf
GROUP BY
	name
ORDER BY
	name;
	