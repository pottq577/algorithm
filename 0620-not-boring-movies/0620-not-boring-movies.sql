SELECT
    *
FROM (
    SELECT *
    FROM cinema
    WHERE id MOD 2 != 0
) a
WHERE
    description NOT IN ('boring')
ORDER BY
    rating DESC