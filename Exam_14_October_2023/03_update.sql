UPDATE
	coaches AS c
SET
	salary = salary * c.coach_level
FROM
	players_coaches pc
WHERE
	c.id = pc.coach_id
	AND c.first_name LIKE 'C%';
