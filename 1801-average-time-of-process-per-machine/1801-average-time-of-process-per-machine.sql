SELECT
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM
    activity AS a
JOIN
    activity AS b
ON
    a.machine_id = b.machine_id
    AND a.process_id = b.process_id
WHERE
    a.activity_type = 'start'
    AND b.activity_type = 'end'
GROUP BY
    a.machine_id