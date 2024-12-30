SELECT
YEAR(booked_at) AS "YEAR",
MONTH(booked_at) AS "MONTH",
DAY(booked_at) AS "DAY",
HOUR(booked_at) AS "HOUR",
MINUTE(booked_at) AS "MINUTE",
SECOND(booked_at) AS "SECOND"
FROM booked_at;