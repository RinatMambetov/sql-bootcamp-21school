SELECT p.name AS name, pizza_name, price, price * ((100 - discount) / 100) AS discount_price, pz.name AS pizzeria_name
  FROM person_order po
           JOIN person p
           ON p.id = po.person_id
           JOIN menu m
           ON m.id = po.menu_id
           JOIN pizzeria pz
           ON pz.id = m.pizzeria_id
           JOIN person_discounts pd
           ON p.id = pd.person_id AND pz.id = pd.pizzeria_id
 ORDER BY name, pizza_name;
