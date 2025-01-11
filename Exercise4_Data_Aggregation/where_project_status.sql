SELECT project_name,
CASE
	WHEN start_date ISNULL AND end_date ISNULL THEN 'Ready for development'
	WHEN start_date IS NOT NULL AND end_date ISNULL THEN 'In Progress'
	ELSE 'Done'
	END AS project_status
FROM projects
WHERE project_name LIKE '%Mountain%';