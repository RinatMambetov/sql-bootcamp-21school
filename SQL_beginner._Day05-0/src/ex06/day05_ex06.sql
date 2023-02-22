DROP INDEX IF EXISTS idx_1;

CREATE OR REPLACE VIEW v_test
AS
SELECT m.pizza_name AS pizza_name, MAX(rating)
                                   OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
  FROM menu m
           INNER JOIN pizzeria pz
           ON m.pizzeria_id = pz.id
 ORDER BY 1, 2;

EXPLAIN ANALYSE
SELECT *
  FROM v_test;

CREATE INDEX IF NOT EXISTS idx_1 ON pizzeria (rating);

EXPLAIN ANALYSE
SELECT *
  FROM v_test;

DROP VIEW IF EXISTS v_test;