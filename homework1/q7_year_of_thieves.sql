SELECT COUNT(DISTINCT(t.primary_title))
FROM titles t
WHERE t.premiered = (SELECT premiered
	FROM titles t
	WHERE t.primary_title = 'Army of Thieves');