SELECT (SELECT name FROM person WHERE id = po.person_id) AS name,
       (SELECT name FROM person WHERE id = po.person_id) = 'Denis' AS check_name
  FROM person_order AS po
 WHERE menu_id IN (13, 14, 18)
   AND order_date = '2022-01-07'
