CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS trigger AS
$person_audit$
BEGIN
    IF (tg_op = 'UPDATE') THEN INSERT INTO person_audit VALUES (NOW(), 'U', old.*); END IF;
    RETURN new;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_update_audit
    AFTER UPDATE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person
   SET name = 'Bulat'
 WHERE id = 10;

UPDATE person
   SET name = 'Damir'
 WHERE id = 10;
