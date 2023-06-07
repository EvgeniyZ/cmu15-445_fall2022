SELECT t.primary_title || '|' || r.votes
FROM people p
JOIN crew c ON p.person_id = c.person_id
JOIN ratings r ON c.title_id = r.title_id
JOIN titles t ON r.title_id = t.title_id
WHERE p.name LIKE '% Cruise' AND p.born = 1962
ORDER BY r.votes DESC
LIMIT 10;