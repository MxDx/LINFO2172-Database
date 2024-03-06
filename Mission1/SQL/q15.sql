/* List the codes and names of the countries without information about their languages.*/
SELECT c.code AS code, c.name AS name
FROM Country c
EXCEPT
SELECT c.code AS code, c.name AS name
FROM Country c
JOIN Language l
ON l.country = c.code;
