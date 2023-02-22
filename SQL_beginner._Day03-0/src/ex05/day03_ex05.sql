  WITH cte AS (SELECT pizzeria_id
                 FROM person_visits pv
                          JOIN person p
                          ON p.id = pv.person_id
                WHERE name = 'Andrey'
               EXCEPT
               SELECT pizzeria_id
                 FROM person_order po
                          JOIN person p
                          ON p.id = po.person_id
                          JOIN menu m
                          ON m.id = po.menu_id
                WHERE name = 'Andrey')
SELECT name AS pizzeria_name
  FROM pizzeria
           JOIN cte
           ON pizzeria.id = pizzeria_id
 ORDER BY pizzeria_name