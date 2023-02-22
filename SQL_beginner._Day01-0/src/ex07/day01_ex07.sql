SELECT order_date, name || ' (age:' || age || ')' AS person_information
  FROM person AS p
           JOIN person_order AS po
           ON p.id = po.person_id
 ORDER BY order_date, person_information


