SELECT
	p.name AS product_name,
	ROUND(AVG(p.price),2) AS average_price,
	COUNT(f.id) AS total_feedbacks
FROM
	products AS p
JOIN
	feedbacks AS f
ON
	p.id = f.product_id
GROUP BY
	p.id
HAVING
	AVG(p.price) > 15.00
	AND COUNT(f.product_id) > 1
ORDER BY
	total_feedbacks,
	average_price DESC;
