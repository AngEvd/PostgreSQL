SELECT
	e.employee_id,
	concat(e.first_name, ' ', e.last_name) as full_name,
	d.department_id,
	d.name
FROM
	employees as e
JOIN
	departments as d ON e.employee_id = d.manager_id
ORDER BY
	e.employee_id
LIMIT 5;

