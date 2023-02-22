CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS
SELECT pz.name AS pizzeria_name
  FROM person_visits pv
           JOIN person p
           ON p.id = pv.person_id
           JOIN pizzeria pz
           ON pz.id = pv.pizzeria_id
           JOIN menu m
           ON pz.id = m.pizzeria_id
 WHERE p.name = 'Dmitriy'
   AND visit_date = '2022-01-08'
   AND price < 800;