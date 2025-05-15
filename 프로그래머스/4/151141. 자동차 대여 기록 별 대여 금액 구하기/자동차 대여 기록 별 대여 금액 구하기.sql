SELECT
    h.history_id,
    ROUND(c.daily_fee * days * IFNULL((100 - p.discount_rate) / 100, 1)) AS fee
FROM (
    SELECT
        history_id,
        car_id,
        DATEDIFF(end_date, start_date) + 1 AS days
    FROM
        car_rental_company_rental_history
) AS h
JOIN
    car_rental_company_car AS c
    ON h.car_id = c.car_id
LEFT JOIN
    car_rental_company_discount_plan AS p
    ON c.car_type = p.car_type
    AND h.days >= p.duration_type
WHERE
    c.car_type = '트럭'
GROUP BY
    h.history_id
HAVING
    fee IS NOT NULL
ORDER BY
    fee DESC, history_id DESC