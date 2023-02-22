CREATE OR REPLACE FUNCTION fnc_persons_female() RETURNS setof person AS
$$
    (SELECT * FROM person WHERE person.gender = 'male');
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_male() RETURNS setof person AS
$$
    (SELECT * FROM person WHERE person.gender = 'female');
$$ LANGUAGE sql;

SELECT *
  FROM fnc_persons_male();

SELECT *
  FROM fnc_persons_female();