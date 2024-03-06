/* List the codes of the countries with more than 10000 cases of Covid in March 2021. */ 
SELECT country
FROM CountryCovid
WHERE total_cases > 10000 AND month = 3 AND year = 2021;
