/* Count the number of different countries whose Covid information was collected. The result must be a relation composed of 1-tuples with attribute {cnt}. */ 
SELECT COUNT(DISTINCT country) AS cnt
FROM CountryCovid;
