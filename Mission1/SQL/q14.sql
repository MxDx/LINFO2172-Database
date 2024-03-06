/* List the capitals of countries who possess a mountain of height strictly superior to 4.000 in the Alps. The result must be a relation composed of 1-tuples with attribute {capital}. */
SELECT DISTINCT c.capital AS capital
FROM Country c
JOIN GeoMountain g
ON g.country = c.code
JOIN Mountain m
ON m.name = g.mountain AND m.height > 4000 AND m.mountains = 'Alps'
