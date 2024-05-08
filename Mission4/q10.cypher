List all countries in Europe for which there is no path of length in between 1 and 3 to a country
(partially) located in Asia.

MATCH (:Continent {name: 'Asia'})-[:Encompasses]->(a:Country),
(e:Continent {name: 'Europe'})-[:Encompasses]->(euPath:Country)-[:Borders*1..3]->(a),
(e)-[:Encompasses]->(rep:Country)
WHERE rep.name <> euPath.name
RETURN rep.name;
