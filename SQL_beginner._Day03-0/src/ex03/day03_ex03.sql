  WITH cte_men(pizzeria_name) AS (SELECT pz.name
                                    FROM person_visits pv
                                             JOIN pizzeria pz
                                             ON pv.pizzeria_id = pz.id
                                             JOIN person p
                                             ON pv.person_id = p.id
                                   WHERE p.gender = 'male'),
       cte_women(pizzeria_name) AS (SELECT pz.name
                                      FROM person_visits pv
                                               JOIN pizzeria pz
                                               ON pv.pizzeria_id = pz.id
                                               JOIN person p
                                               ON pv.person_id = p.id
                                     WHERE p.gender = 'female')
SELECT pizzeria_name
  FROM cte_men
EXCEPT ALL
SELECT pizzeria_name
  FROM cte_women
 UNION ALL
  (SELECT pizzeria_name FROM cte_women EXCEPT ALL SELECT pizzeria_name FROM cte_men)
 ORDER BY pizzeria_name