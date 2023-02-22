CREATE TABLE person_audit
    (
        created timestamp WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
        type_event char(1) DEFAULT 'I' NOT NULL,
        row_id bigint NOT NULL,
        name varchar,
        age integer,
        gender varchar,
        address varchar
    );

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event
    CHECK ( type_event IN ('I', 'U', 'D') );

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS
$person_audit$
BEGIN
    IF (tg_op = 'INSERT') THEN INSERT INTO person_audit VALUES (NOW(), 'I', new.*); END IF;
    RETURN new;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');