UPDATE
	products AS p
SET
	price = price * 1.1
FROM
	feedbacks AS f
WHERE
	f.product_id = p.id
	AND f.rate > 8;
