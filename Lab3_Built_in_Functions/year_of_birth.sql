SELECT first_name, last_name,
DATE_PART('year', born) AS year
FROM authors;