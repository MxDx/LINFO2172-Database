/* List all provinces in Europe whose area is less than 200. The results must be a relation composed of 
 * 2-tuples with attributes {province, country}, corresponding to the full province name and the full country name, respectively. */ 
SELECT p.name AS province, c.name AS country
FROM Province p
JOIN Country c
ON p.country = c.code AND p.area < 200
JOIN Encompasses e 
ON e.country = p.country AND e.continent = 'Europe';
