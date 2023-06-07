-- Details: Get the average rating (rounded to two decimal places), top rating, min rating, and the number of releases in each decade. Exclude titles which have not been premiered (i.e. where premiered is NULL). 
-- Print the relevant decade in a fancier format by constructing a string that looks like this: 1990s. Order the decades first by their average rating in a descending fashion and secondly by the decade, ascending, to break ties.
-- Your output should have the format: DECADE|AVG_RATING|TOP_RATING|MIN_RATING|NUM_RELEASES 
WITH premieredTitles (title_id, premiered) AS (
	SELECT t.title_id, t.premiered
	FROM titles t
	WHERE t.premiered IS NOT NULL
)
SELECT (premiered / 10) || '0s' as decade, 
	ROUND(AVG(r.rating), 2) as average, 
	MAX(r.rating), 
	MIN(r.rating), 
	COUNT(*)
FROM ratings r
JOIN premieredTitles pt
ON r.title_id = pt.title_id
GROUP BY premiered / 10
ORDER BY average DESC, decade ASC;