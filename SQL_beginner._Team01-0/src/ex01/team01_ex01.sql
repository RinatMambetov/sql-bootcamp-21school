INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

  WITH cte_cur AS (SELECT balance.user_id, currency.id, currency.name, balance.money,
                          (SELECT currency.rate_to_usd
                             FROM currency
                            WHERE currency.id = balance.currency_id
                              AND currency.updated < balance.updated
                            ORDER BY rate_to_usd
                            LIMIT 1) AS rate_min,
                          (SELECT currency.rate_to_usd
                             FROM currency
                            WHERE currency.id = balance.currency_id
                              AND currency.updated > balance.updated
                            ORDER BY rate_to_usd
                            LIMIT 1) AS rate_max
                     FROM currency
                              JOIN balance
                              ON currency.id = balance.currency_id
                    GROUP BY balance.money, currency.name, currency.id, balance.updated, balance.currency_id,
                             balance.user_id
                    ORDER BY rate_min DESC, rate_max)
SELECT COALESCE("user".name, 'not defined') AS name, COALESCE("user".lastname, 'not defined') AS lastname,
       cte_cur.name AS currency_name, cte_cur.money * COALESCE(cte_cur.rate_min, cte_cur.rate_max) AS currency_in_usd
  FROM cte_cur
           LEFT JOIN "user"
           ON cte_cur.user_id = "user".id
 ORDER BY name DESC, lastname, currency_name;
