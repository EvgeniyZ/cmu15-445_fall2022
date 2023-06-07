WITH averages AS (
	SELECT ROUND(AVG(r.rating), 2) as avg_rating, p.person_id as id
	FROM people p
	JOIN crew c ON p.person_id = c.person_id
	JOIN ratings r ON c.title_id = r.title_id
	WHERE p.born = 1955
	GROUP BY p.person_id
)
SELECT * FROM(
	SELECT p.name || '|' || a.avg_rating, NTILE(10) OVER (ORDER BY a.avg_rating) AS nineDecile
	FROM people p
	JOIN averages a ON p.person_id = a.id
	ORDER BY a.avg_rating DESC, p.name ASC) result
WHERE result.nineDecile = 9;