SELECT
    w1.id
FROM 
    weather AS w1
JOIN
    weather AS w2
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE
    w1.temperature > w2.temperature
