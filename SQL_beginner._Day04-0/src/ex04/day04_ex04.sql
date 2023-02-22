CREATE VIEW v_symmetric_union
AS
  WITH cte_r AS (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-02'),
       cte_s AS (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-06')
SELECT *
  FROM cte_r
EXCEPT
SELECT *
  FROM cte_s
 UNION
(SELECT * FROM cte_s EXCEPT SELECT * FROM cte_r)
 ORDER BY person_id;