SELECT
	bookings.booking_id,
	customers.first_name AS customer_name
FROM
	bookings, customers
ORDER BY
	customers.first_name;