/* List all names shared by a province and a country’s capital whose country had reached strictly more than 10000 
 * Covid deaths at some point in time, as determined by attribute total_death in the CountryCovid table. 
 * Note that the total_death attribute stores the total number of deaths up till a certain moment in time. */
SELECT DISTINCT p.name
FROM CountryCovid cv
JOIN Province p ON cv.country = p.country
JOIN Country c ON p.name = c.capital
WHERE cv.total_deaths > 10000;
