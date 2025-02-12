SELECT
	mc.country_code,
	m.mountain_range,
	p.peak_name,
	p.elevation
FROM
	mountains AS m
JOIN
	peaks AS p
ON
	p.mountain_id = m.id
JOIN
	mountains_countries AS mc
ON
	mc.mountain_id = m.id
WHERE
	mc.country_code = 'BG' AND p.elevation > 2835
ORDER BY
	elevation DESC;
		