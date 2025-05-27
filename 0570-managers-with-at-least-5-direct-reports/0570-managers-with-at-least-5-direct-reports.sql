SELECT
    e.name
FROM
    employee AS e
JOIN (
    SELECT managerId
    FROM employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) m
ON e.id = m.managerId;