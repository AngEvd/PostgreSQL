SELECT
    country_code,
    COUNT(mountain_range)
FROM
(SELECT
    mc.country_code,
    m.mountain_range
FROM
    mountains AS m
JOIN
    mountains_countries AS mc
ON
    m.id = mc.mountain_id
WHERE
    country_code IN ('US', 'BG', 'RU')) AS mmc
GROUP BY
    country_code
ORDER BY
    count DESC;
