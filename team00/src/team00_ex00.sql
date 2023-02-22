CREATE OR REPLACE VIEW v_tours
AS
  WITH RECURSIVE a_traces AS ((SELECT point1 AS tour, point1, point2, cost, cost AS sum FROM nodes WHERE point1 = 'a')
   UNION ALL
  (SELECT parent.tour || ',' || child.point1, child.point1, child.point2, child.cost, parent.sum + child.cost AS sum
     FROM nodes AS child
              JOIN a_traces AS parent
              ON child.point1 = parent.point2
    WHERE tour NOT LIKE '%' || child.point1 || '%'))
SELECT *
  FROM a_traces
 WHERE LENGTH(tour) = 7
   AND point2 = 'a';

SELECT sum AS total_cost, '{' || tour || ',' || point2 || '}' AS tour
  FROM v_tours
 WHERE sum = (SELECT MIN(sum) FROM v_tours)
 ORDER BY total_cost, tour;