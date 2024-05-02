// List the pairs of countries that neighbor China, and that are also neighbors of each other.
Provide the full names of both countries; only list the pairs in which the first name of the pair
is strictly lower than the second name in the pair.

MATCH
(c1:Country)-[:Borders]->(china:Country {name: 'China'}),
(c2:Country)-[:Borders]->(china),
(c1)-[:Borders]->(c2)
WHERE c1.name < c2.name
RETURN c1.name, c2.name

