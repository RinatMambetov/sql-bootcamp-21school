SELECT name
  FROM person_order AS po
           JOIN person p
           ON po.person_id = p.id
           JOIN menu m
           ON m.id = po.menu_id
 WHERE gender = 'male'
   AND address IN ('Moscow', 'Samara')
   AND pizza_name IN ('pepperoni pizza', 'mushroom pizza')
 ORDER BY name DESC