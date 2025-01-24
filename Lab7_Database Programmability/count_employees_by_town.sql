CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name varchar(20))
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
	count_of_employees INT;
BEGIN
 	SELECT
		COUNT(e.employee_id)
	FROM
		employees AS e
	JOIN
		addresses AS a
	ON
		a.address_id = e.address_id
	JOIN
		towns AS t
	ON
		t.town_id = a.town_id
	WHERE
		t.name = town_name
	GROUP BY
		t.name
	INTO count_of_employees;
	RETURN count_of_employees;
END;
$$;
