SELECT
    YEAR(o.sales_date) AS 'year',
    MONTH(o.sales_date) AS 'month',
    COUNT(DISTINCT o.user_id) AS 'purchased_users',
    ROUND(COUNT(DISTINCT o.user_id) / (
        SELECT COUNT(*)
        FROM user_info
        WHERE YEAR(joined) = 2021
    ), 1) AS 'purchased_ratio'
FROM
    online_sale AS o
JOIN
    user_info AS u
ON
    o.user_id = u.user_id
WHERE
    YEAR(u.joined) = '2021'
GROUP BY
    YEAR(o.sales_date), MONTH(o.sales_date)
ORDER BY
    year, month