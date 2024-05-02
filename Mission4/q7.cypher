Determine the shortest path from Belgium to China; provide the complete path, that is, all
nodes and edges on this path, starting from Belgium and ending in China.

MATCH s=shortestPath(
    (b:Country {name: 'Belgium'})-[:Borders*]->(c:Country {name: 'China'})
)
RETURN s
