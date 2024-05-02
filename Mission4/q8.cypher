Find the country which has the longest shortest path to Belgium; provide the full name of this
country.

MATCH s=shortestPath(
    (c:Country)-[:Borders*]->(b:Country {name: 'Belgium'})
)
WHERE b.name <> c.name 
WITH c, length(s) AS size
ORDER BY size DESC
RETURN c.name, size
LIMIT 1
