Provide the full names of all countries in Asia that can be reached in at most two steps from
Turkey, excluding Turkey itself. Make sure to include every country in the output only once.

MATCH (c:Country)-[:Borders*1..2]->(:Country {name: 'Turkey'})
RETURN DISTINCT c.name;
