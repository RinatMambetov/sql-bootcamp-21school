CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger AS
$person_audit$
BEGIN
    IF (tg_op = 'DELETE') THEN INSERT INTO person_audit VALUES (NOW(), 'D', old.*); END IF;
    RETURN old;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE
  FROM person
 WHERE id = 10;