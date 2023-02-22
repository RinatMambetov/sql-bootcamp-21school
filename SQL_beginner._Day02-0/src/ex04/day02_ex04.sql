SELECT pizza_name, name AS pizzeria_name, price
  FROM pizzeria AS pz
           JOIN menu AS m
           ON pz.id = m.pizzeria_id
 WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
 ORDER BY pizza_name, pizzeria_name