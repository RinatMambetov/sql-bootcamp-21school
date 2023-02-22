DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;

TRUNCATE TABLE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS trigger AS
$person_audit$
BEGIN
    IF (tg_op = 'INSERT') THEN
        INSERT INTO person_audit SELECT NOW(), 'I', new.*;
        RETURN new;
    ELSIF (tg_op = 'UPDATE') THEN
        INSERT INTO person_audit VALUES (NOW(), 'U', old.*);
        RETURN new;
    ELSIF (tg_op = 'DELETE') THEN
        INSERT INTO person_audit VALUES (NOW(), 'D', old.*);
        RETURN old;
    END IF;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person
   SET name = 'Bulat'
 WHERE id = 10;

UPDATE person
   SET name = 'Damir'
 WHERE id = 10;

DELETE
  FROM person
 WHERE id = 10;