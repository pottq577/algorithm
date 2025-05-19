SELECT
    name
FROM
    customer AS c
WHERE
    referee_id != 2 OR referee_id IS NULL