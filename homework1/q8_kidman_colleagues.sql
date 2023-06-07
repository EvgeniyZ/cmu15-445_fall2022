SELECT DISTINCT(p.name)
FROM crew c
JOIN people p ON c.person_id = p.person_id
WHERE c.title_id IN (SELECT c.title_id
	FROM people p
	JOIN crew c ON p.person_id = c.person_id
	WHERE p.name = 'Nicole Kidman' AND born = 1967)
AND c.category IN ('actor','actress')
ORDER BY p.name;