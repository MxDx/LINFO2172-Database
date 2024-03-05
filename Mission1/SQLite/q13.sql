/* List country codes and full names of countries that share borders with both countries China and India. The result relation is composed of 2-tuples with attributes {code, name}. */ 
SELECT c1.code AS code, c1.name AS name
FROM Country c1
JOIN Borders b1
ON c1.code = b1.country1 AND b1.country2 = 'TJ'
INTERSECT
SELECT c1.code AS code, c1.name AS name
FROM Country c1
JOIN Borders b1
ON c1.code = b1.country1 AND b1.country2 = 'IND';
