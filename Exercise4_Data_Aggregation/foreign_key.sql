CREATE TABLE employees_projects (
	id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
	employee_id INT NOT NULL REFERENCES employees(id),
	project_id INT NOT NULL REFERENCES projects(id)
);