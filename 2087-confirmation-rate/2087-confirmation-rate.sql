SELECT
    s.user_id,
    ROUND(IFNULL(c.confirmation_count / t.total_count, 0), 2) AS confirmation_rate
FROM
    signups AS s
LEFT JOIN (
    SELECT user_id, COUNT(*) AS total_count
    FROM confirmations
    GROUP BY user_id
) AS t
    ON s.user_id = t.user_id
LEFT JOIN (
    SELECT user_id, COUNT(*) AS confirmation_count
    FROM confirmations
    WHERE action = 'confirmed'
    GROUP BY user_id
) AS c
    ON s.user_id = c.user_id