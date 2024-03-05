/* In the given database the Borders relation is symmetric":" if the country 1 (c1) borders country 2 (c2), country 2 also borders country 1. 
 * One may wish to check this property on a given database. Write a query that determines all tuples {c1, c2}, where c1 and c2 are the codes 
 * of the countries, for which the inverse direction is missing. (Note":" on the given database, the output of this query should be empty; 
 * on a database in which the Border relation is not symmetric, however, it should return the violating tuples. Create a database yourself to check this.) */ 

-- Creating test database
CREATE TABLE Test (
    country1 VARCHAR(3) NOT NULL,
    country2 VARCHAR(3) NOT NULL
);

INSERT INTO Test (country1, country2) VALUES ('USA', 'MEX');
INSERT INTO Test (country1, country2) VALUES ('MEX', 'USA');
INSERT INTO Test (country1, country2) VALUES ('USA', 'CAN');


SELECT cc1.country1 AS c1, cc1.country2 AS c2
FROM Borders cc1
EXCEPT
SELECT cc2.country2 AS c1, cc2.country1 AS c2
FROM Borders cc2;
