/* List the most prominent language(s) for each country; i.e., list for each country those languages for which the percentage is maximal.
 * The result must be a relation composed of 2-tuples with attributes {country, name}, where country is the code of the country and name is the name of the language. */
SELECT country, name
FROM Language
GROUP BY country
HAVING MAX(percentage);

/* Wihtout GOUB BY */ 
SELECT DISTINCT l.country AS country, l.name AS name
FROM Language AS l 
EXCEPT
SELECT DISTINCT l2.country AS country, l2.name AS name
FROM Language AS l2
JOIN Language AS l3
ON l3.country = l2.country AND l3.percentage > l2.percentage;
