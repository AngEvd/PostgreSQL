ALTER TABLE countries
ADD capital_code CHAR(2);
UPDATE countries
SET capital_code = LEFT(capital, 2);

SELECT * FROM countries;