INSERT INTO person_order
VALUES (GENERATE_SERIES((SELECT MAX(id) + 1 FROM person_order),
                        (SELECT MAX(id) + (SELECT MAX(id) FROM person) FROM person_order), 1),
        GENERATE_SERIES((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person), 1),
        (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25')