CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id int)
LANGUAGE plpgsql    
AS 
$$
BEGIN
	IF 
		(SELECT COUNT(employee_id) FROM employees WHERE employee_id = id) != 1
	THEN
		RETURN;
	END IF;
		UPDATE
			employees
		SET
			salary = salary * 1.05
		WHERE
			employee_id = id;
	COMMIT;
END;
$$;
