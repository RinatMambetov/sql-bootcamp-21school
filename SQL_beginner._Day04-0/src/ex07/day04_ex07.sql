CREATE VIEW v_cheaper_pz
AS
SELECT name
  FROM pizzeria pz
           JOIN menu m
           ON pz.id = m.pizzeria_id
 WHERE price < 800;

CREATE VIEW v_dmitriy_new_visit
AS
SELECT id
  FROM pizzeria
 WHERE name NOT IN (SELECT * FROM mv_dmitriy_visits_and_eats)
   AND name IN (SELECT * FROM v_cheaper_pz);

INSERT INTO person_visits
VALUES ((SELECT MAX(id) + 1 FROM person_visits), (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT * FROM v_dmitriy_new_visit LIMIT 1), '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
