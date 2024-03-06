/* For each country that has declared independence, give its full name and its independence date. */
SELECT c.name AS name, i.Independence AS Independence
FROM Country c
JOIN Independence i
ON c.code = i.country;
