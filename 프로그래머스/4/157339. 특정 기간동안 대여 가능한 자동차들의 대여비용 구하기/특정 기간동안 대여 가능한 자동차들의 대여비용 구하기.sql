SELECT
    c.car_id,
    c.car_type,
    ROUND(c.daily_fee * 30 * (100 - p.discount_rate) / 100) AS fee
FROM
    car_rental_company_car AS c
JOIN
    car_rental_company_rental_history AS h
    ON c.car_id = h.car_id
JOIN
    car_rental_company_discount_plan AS p
    ON c.car_type = p.car_type
WHERE
    c.car_id NOT IN (
        SELECT car_id
        FROM car_rental_company_rental_history
        WHERE end_date >= '2022-11-01' AND start_date <= '2022-12-01'
    )
    AND p.duration_type LIKE '30%'
GROUP BY
    c.car_id
HAVING
    c.car_type IN ('세단', 'SUV')
    AND (fee BETWEEN 500000 AND 2000000)
ORDER BY
    fee DESC, car_type, car_id DESC