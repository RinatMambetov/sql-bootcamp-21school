DROP FUNCTION IF EXISTS fnc_persons_male;
DROP FUNCTION IF EXISTS fnc_persons_female;

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female') RETURNS setof person AS
$$
    (SELECT * FROM person WHERE person.gender = pgender);
$$ LANGUAGE sql;

SELECT *
  FROM fnc_persons(pgender := 'male');

SELECT *
  FROM fnc_persons();
