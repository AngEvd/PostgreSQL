INSERT INTO
	coaches (first_name, last_name, salary, coach_level)
SELECT
	p.first_name,
	p.last_name,
	salary * 2,
	LENGTH(p.first_name)
FROM
	players AS p
WHERE
	p.hire_date < '2013-12-13 07:18:46';
