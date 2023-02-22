CREATE VIEW v_price_with_discount
AS
SELECT p.name, pizza_name, price, CAST(ROUND(price - (price * 0.1)) AS int) AS discount_price
  FROM person_order po
           JOIN person p
           ON po.person_id = p.id
           JOIN menu m
           ON po.menu_id = m.id
 ORDER BY p.name, pizza_name
;
