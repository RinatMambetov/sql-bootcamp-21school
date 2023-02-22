  WITH cte_v AS (SELECT name, COUNT(person_id) AS count, 'visit' AS action_type
                   FROM person_visits pv
                            JOIN pizzeria pz
                            ON pv.pizzeria_id = pz.id
                  GROUP BY name
                  ORDER BY count DESC
                  LIMIT 3),
       cte_o AS (SELECT name, COUNT(person_id) AS count, 'order' AS action_type
                   FROM person_order po
                            JOIN menu m
                            ON po.menu_id = m.id
                            JOIN pizzeria pz
                            ON pz.id = m.pizzeria_id
                  GROUP BY name
                  ORDER BY count DESC
                  LIMIT 3)
SELECT *
  FROM cte_v
 UNION
SELECT *
  FROM cte_o
 ORDER BY action_type, count DESC