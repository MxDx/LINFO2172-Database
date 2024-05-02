MATCH (c:Country)-[:Borders]->(g:COUNTRY {name: 'Greece'})
RETURN c.name
