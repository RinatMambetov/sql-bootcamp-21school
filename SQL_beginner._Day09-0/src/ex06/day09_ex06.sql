CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy',
                                                              IN pprice numeric DEFAULT 500,
                                                              IN pdate date DEFAULT '2022-01-08')
    RETURNS TABLE
                (
                    name varchar
                )
AS
$$
BEGIN
    RETURN QUERY SELECT pz.name
                   FROM person_visits pv
                            JOIN person_order po
                            ON po.person_id = pv.person_id
                            JOIN pizzeria pz
                            ON pv.pizzeria_id = pz.id
                            JOIN menu m
                            ON m.id = po.menu_id AND m.pizzeria_id = pz.id
                            JOIN person p
                            ON p.id = po.person_id AND p.id = pv.person_id
                  WHERE p.name = pperson
                    AND visit_date = pdate
                    AND order_date = pdate
                    AND price < pprice;
END;
$$ LANGUAGE plpgsql;

SELECT *
  FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
  FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
