List the number of neighboring countries for every country fully located in Europe (i.e., this is
the degree of every country in Europe, when only considering the Borders relation). Provide for
each country the full name, and its degree. Sort the output in decreasing order of degree.

MATCH (:Continent {name: 'Europe'})-[:Encompasses]->(c:Country)
MATCH (c)-[:Borders]->()
WITH c, count(c) AS degree
ORDER BY degree DESC
RETURN c.name, degree
