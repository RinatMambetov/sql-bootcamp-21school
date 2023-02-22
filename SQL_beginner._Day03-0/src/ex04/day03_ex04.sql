  WITH cte_men(pizzeria_name) AS (SELECT pz.name
                                    FROM menu m
                                             JOIN pizzeria pz
                                             ON pz.id = m.pizzeria_id
                                             JOIN person_order po
                                             ON po.menu_id = m.id
                                             JOIN person p
                                             ON po.person_id = p.id
                                   WHERE p.gender = 'male'),
       cte_women(pizzeria_name) AS (SELECT pz.name
                                      FROM menu m
                                               JOIN pizzeria pz
                                               ON pz.id = m.pizzeria_id
                                               JOIN person_order po
                                               ON po.menu_id = m.id
                                               JOIN person p
                                               ON po.person_id = p.id
                                     WHERE p.gender = 'female')
SELECT pizzeria_name
  FROM cte_men
EXCEPT
SELECT pizzeria_name
  FROM cte_women
 UNION
  (SELECT pizzeria_name FROM cte_women EXCEPT SELECT pizzeria_name FROM cte_men)
 ORDER BY pizzeria_name