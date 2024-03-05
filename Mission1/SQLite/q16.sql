/* List the mountain ranges (as defined by the attribute mountains in Table Mountain) in which there is 
 * a mountain that stands on at least two countries. For example, Alps is a mountain range and it hosts the 
 * mountain Mont Blanc on the border of France and Italy. The result must be a relation composed of 1-tuples with attribute {mountains}. */
SELECT DISTINCT m.mountains AS mountains
FROM Mountain m
JOIN GeoMountain g
ON m.name = g.mountain
GROUP BY m.name
HAVING COUNT(DISTINCT g.country) > 1;
