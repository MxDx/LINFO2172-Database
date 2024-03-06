/* List the name of all countries which have zero Covid cases until 12/2021 (included) and their neighboring countries. 
 * The result must be a relation composed of tuples of 2 attributes {country1, country2} where the country1 is the zero-Covid 
 * country and country2 is its neighboring country. Note that also if no information is present in the database for a country,
 * this country and its neighbors should be included in the output relation. */ 
SELECT country1, country2
FROM (
    SELECT c1.name AS country1, c2.name AS country2
    FROM Country c1
    JOIN Borders b ON c1.code = b.country1
    JOIN Country c2 ON b.country2 = c2.code
    WHERE c1.code IN (
        SELECT c.code
        FROM Country c
        LEFT JOIN CountryCovid cc ON c.code = cc.country
        WHERE cc.country IS NULL OR cc.total_cases = 0
    )
)

/* Optimization */
SELECT c1.name AS country1, c2.name AS country2
FROM CountryCovid cv
LEFT JOIN Country c1 
ON cv.country = c1.code AND cv.year <= 2021 AND cv.month <= 12
LEFT JOIN Borders b ON b.country1 = cv.country 
LEFT JOIN Country c2 ON b.country2 = c2.code
GROUP BY c1.name, c2.name
HAVING SUM(cv.total_cases) = 0;

/* Modified */ 
SELECT DISTINCT c1.name AS country1, c2.name AS country2
FROM Country c1
LEFT JOIN CountryCovid cv 
ON c1.code = cv.country
LEFT JOIN Borders b ON b.country1 = c1.code
JOIN Country c2 ON b.country2 = c2.code
WHERE cv.total_cases IS NULL OR cv.year=2021 AND cv.month=12 AND cv.total_deaths=0;
