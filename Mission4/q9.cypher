 Luxembourg is in a specific topographic situation: it has exactly three neighboring countries
(Belgium, Germany, and France), each of which are pairwise neighbors of each other as well.
As a result, Luxembourg is surrounded by exactly three countries. List the full names of all
countries that are in a similar situation as Luxembourg.

MATCH (center:Country)-[:Borders]->(:Country)
WITH center, count(center) AS degree
WHERE degree = 3
MATCH 
(center)-[:Borders]->(c1:Country),
(center)-[:Borders]->(c2:Country),
(center)-[:Borders]->(c3:Country),
(c1)-[:Borders]->(c2),
(c1)-[:Borders]->(c3),
(c2)-[:Borders]->(c3)
WHERE c1.name <> c2.name AND c1.name <> c3.name AND c2.name <> c3.name
WITH center
RETURN DISTINCT center.name
