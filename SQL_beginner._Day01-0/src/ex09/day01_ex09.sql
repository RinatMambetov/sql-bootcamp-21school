SELECT name
  FROM pizzeria AS pz
 WHERE NOT EXISTS(SELECT pizzeria_id FROM person_visits WHERE pizzeria_id = pz.id);

SELECT name
  FROM pizzeria AS pz
 WHERE pz.id NOT IN (SELECT pizzeria_id FROM person_visits);
