  WITH cte_not_order(not_order) AS (SELECT id AS menu_id
                                      FROM menu
                                    EXCEPT
                                    SELECT menu_id
                                      FROM person_order
                                     ORDER BY menu_id)
SELECT pizza_name, price, name AS pizzeria_name
  FROM menu AS m
           JOIN cte_not_order
           ON not_order = m.id
           JOIN pizzeria pz
           ON pz.id = m.pizzeria_id
 ORDER BY pizza_name, price