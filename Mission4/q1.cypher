MATCH (c:Country)-[:Borders]->(g:COUNTRY {name: 'Greece'})
RETURN DISTINCT c.name;
