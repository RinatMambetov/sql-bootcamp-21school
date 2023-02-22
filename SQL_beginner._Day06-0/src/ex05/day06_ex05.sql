COMMENT ON TABLE person_discounts IS 'This table is used to store person-specific discounts for pizzerias';
COMMENT ON COLUMN person_discounts.id IS 'The id column is used as the primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'The person_id and pizzeria_id columns define the person and pizzeria combinations for which discounts can be applied';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The person_id and pizzeria_id columns define the person and pizzeria combinations for which discounts can be applied';
COMMENT ON COLUMN person_discounts.discount IS 'The discount column is used to store the discount amount';
