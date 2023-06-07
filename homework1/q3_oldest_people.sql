SELECT name || '|' || (strftime('%Y', DATE()) - born), died
FROM people
WHERE born >= 1900 AND died IS NULL
ORDER BY (strftime('%Y', DATE()) - born) DESC, name ASC
LIMIT 20;