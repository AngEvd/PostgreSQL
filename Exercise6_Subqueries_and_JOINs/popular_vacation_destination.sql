SELECT
	country,
	COUNT(booked_at) AS booking_count
FROM
	(SELECT
		a.country,
		b.booked_at
	FROM
		bookings AS b
	JOIN
		apartments AS a
	ON
		a.apartment_id = b.apartment_id
	WHERE
		b.booked_at > '2021-05-18 07:52:09.904+03'
	AND
         b.booked_at < '2021-09-17 19:48:02.147+03') as cba
GROUP BY country
ORDER BY booking_count DESC;
		