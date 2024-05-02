Provide the full names of all countries that are 100% located in Europe, but that border a
country located (not, or not entirely located) in Europe.

MATCH (europe:Continent {name: 'Europe'})-[:Encompasses {percentage: '100.0'}]->(inEU:Country)
WITH collect(inEU) as euCountries
MATCH (outEU:Country),
(europe:Continent {name: 'Europe'})-[:Encompasses {percentage: '100.0'}]->(inEU:Country)-[:Borders]->(outEU)
WHERE NOT outEU IN euCountries
RETURN DISTINCT inEU.name
