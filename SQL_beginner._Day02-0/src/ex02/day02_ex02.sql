SELECT COALESCE(person.name, '-') AS person_name, visit_date, COALESCE(pizzeria.name, '-') AS pizzeria_name
  FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pz
           FULL JOIN pizzeria
           ON pz.pizzeria_id = pizzeria.id
           FULL JOIN person
           ON pz.person_id = person.id
 ORDER BY 1, 2, 3