Find the country with the largest number of neighbors; if there are multiple such countries, it
is allowed to break ties arbitrarily; provide the full name and the number of neighbors.

MATCH (c:Country)-[:Borders]->()
WITH c, count(c) AS degree
ORDER BY degree DESC
RETURN c.name, degree
LIMIT 1
