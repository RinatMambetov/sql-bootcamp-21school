CREATE TABLE IF NOT EXISTS person_discounts
    (
        id bigint
            PRIMARY KEY,
        person_id bigint NOT NULL,
        pizzeria_id bigint NOT NULL,
        discount numeric(4, 1),
        CONSTRAINT fk_person_discounts_person_id
            FOREIGN KEY (person_id) REFERENCES person (id),
        CONSTRAINT fk_person_discounts_pizzeria_id
            FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
    );