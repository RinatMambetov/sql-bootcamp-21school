SELECT sum AS total_cost, '{' || tour || ',' || point2 || '}' AS tour
  FROM v_tours
 ORDER BY total_cost, tour;