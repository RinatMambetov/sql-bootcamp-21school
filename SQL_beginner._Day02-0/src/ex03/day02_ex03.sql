  WITH cte(missing_date) AS (SELECT days::DATE
                               FROM GENERATE_SERIES('2022-01-01', '2022-01-10', INTERVAL '1 day') AS days)
SELECT missing_date
  FROM cte
           FULL JOIN (SELECT *
                        FROM person_visits
                       WHERE (person_id = 1 OR person_id = 2) AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS d
           ON missing_date = d.visit_date
 WHERE d.person_id IS NULL
 ORDER BY missing_date