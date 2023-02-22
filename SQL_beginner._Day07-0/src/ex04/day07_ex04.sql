  WITH cte AS (SELECT name, COUNT(person_id) AS count_of_visits
                 FROM person_visits po
                          JOIN person p
                          ON p.id = po.person_id
                GROUP BY name)
SELECT *
  FROM cte
 GROUP BY name, count_of_visits
HAVING count_of_visits > 3;
