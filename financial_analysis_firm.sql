SELECT
    i.email,
    COUNT(cf.cash_flow) AS investments,
    MIN(cf.cash_flow) AS min_cash_flow,
    MAX(cf.cash_flow) AS max_cash_flow,
    ROUND(AVG(cf.cash_flow), 2) AS avg_cash_flow
FROM
    investors i
JOIN
    cash_flows cf ON i.id = cf.investor_id
GROUP BY
    i.email
HAVING
    SUM(cf.cash_flow) > 1000000
ORDER BY
    i.email;
