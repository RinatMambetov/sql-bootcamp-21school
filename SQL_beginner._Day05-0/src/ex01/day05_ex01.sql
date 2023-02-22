SET ENABLE_SEQSCAN TO off;

EXPLAIN ANALYSE
SELECT pizza_name, name AS pizzeria_name
  FROM menu m
           JOIN pizzeria pz
           ON m.pizzeria_id = pz.id