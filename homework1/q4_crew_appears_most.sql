SELECT inner.name || '|' || inner.most
FROM (SELECT name, COUNT(*) as most
	FROM people p
	JOIN crew c 
	ON p.person_id = c.person_id
	GROUP BY p.name) as inner
ORDER BY inner.most DESC
LIMIT 20;
