SELECT
    u.unique_id,
    e.name
FROM
    employees AS e
LEFT JOIN
    employeeUNI AS u
ON
    e.id = u.id