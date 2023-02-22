SELECT name, rating
  FROM pizzeria AS p
           LEFT JOIN person_visits AS pv
           ON p.id = pv.pizzeria_id
 WHERE visit_date IS NULL
