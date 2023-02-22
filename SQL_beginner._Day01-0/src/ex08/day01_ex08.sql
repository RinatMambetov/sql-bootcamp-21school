SELECT order_date, name || ' (age:' || age || ')' AS person_information
  FROM person
           NATURAL JOIN (SELECT person_id AS id, order_date FROM person_order) AS po
 ORDER BY order_date, person_information


