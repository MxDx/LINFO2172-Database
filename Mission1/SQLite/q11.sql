/* List all countries in Europe whose total number of deaths in December 2022 exceeded 10,000.
 * The result must be a relation composed of 3-tuples with attributes {country, population, total_deaths}, 
 * corresponding to the full country name, its population, and its number of deaths respectively. */ 
SELECT c.name AS country, c.population AS population, cc.total_deaths AS total_deaths
FROM Country c
JOIN Encompasses e
ON c.code = e.country AND e.continent = 'Europe'
JOIN CountryCovid cc
ON c.code = cc.country AND cc.month = 12 AND cc.year = 2022 AND cc.total_deaths > 10000;
