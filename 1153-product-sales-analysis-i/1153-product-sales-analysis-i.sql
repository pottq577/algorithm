SELECT
    p.product_name,
    s.year,
    s.price
FROM
    product AS p
JOIN
    sales AS s
    ON p.product_id = s.product_id