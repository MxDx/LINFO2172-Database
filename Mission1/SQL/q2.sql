/* List the full names of the countries that border the United States, as well as the countries that border those bordering countries. 
 * I.e., the output should contain Mexico, but also Belize, which borders Mexico. The United States itself should not be part of the output. */
SELECT c.name AS name
FROM Country AS c
JOIN (
	SELECT b.country1
	FROM (
		SELECT country1, country2
		FROM Borders b
		WHERE b.country2 = 'USA'
	) AS b
	UNION 
	SELECT b.country1
	FROM Borders b
	JOIN (
		SELECT country1, country2
		FROM Borders b
		WHERE b.country2 = 'USA'
	) AS t ON t.country1 = b.country2
	WHERE b.country1 != 'USA'
) AS b
ON b.country1 = c.code;

/* Optimization */ 
SELECT c.name AS name
FROM Country AS c
JOIN Borders AS b ON b.country1 = c.code
WHERE b.country2 = 'USA' AND b.country1 != 'USA'

UNION

SELECT c.name AS name
FROM Country AS c
JOIN Borders AS b ON b.country2 = c.code
JOIN Borders AS t ON t.country1 = b.country1 AND t.country2 = 'USA'
WHERE b.country2 != 'USA';
