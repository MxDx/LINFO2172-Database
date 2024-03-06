/* Some countries have incomplete information about their dialects and languages. List the name of countries for which the total percentage 
 * of reported languages does not reach 99% together with the proportion of the population for which this information is unknown. 
 * The result should have the form {name, unknown_lang_p}. (We expect unknown_lang_p to be a "real" number. 
 * In SQL, you can cast any column as a real with: CAST(expression as real)). Hint : use sum(percentage) or total(percentage) as seen in the slides. */
SELECT c.name AS name, CAST(COALESCE(100 - SUM(percentage), 100) AS real) AS unknown_lang_p
FROM Country c
LEFT JOIN Language l
ON c.code = l.country
GROUP BY c.code
HAVING COALESCE(SUM(percentage), 0) != 100;
