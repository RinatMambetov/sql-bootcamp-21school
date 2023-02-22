SELECT pizza_name, pz.name AS pizzeria_name
  FROM person_order
           JOIN person AS p
           ON person_order.person_id = p.id
           JOIN menu AS m
           ON person_order.menu_id = m.id
           JOIN pizzeria AS pz
           ON pz.id = m.pizzeria_id
 WHERE p.name IN ('Denis', 'Anna')
 ORDER BY pizza_name, pizzeria_name