SELECT name, COUNT(pizzeria_id) AS count_of_orders, ROUND(AVG(price), 2) AS average_price, MAX(price) AS max_price,
       MIN(price) AS min_price
  FROM person_order po
           JOIN menu m
           ON m.id = po.menu_id
           JOIN pizzeria pz
           ON pz.id = m.pizzeria_id
 GROUP BY name
 ORDER BY name