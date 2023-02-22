CREATE VIEW v_persons_male
AS
SELECT id, name, age, gender, address
  FROM person
 WHERE gender = 'male';

CREATE VIEW v_persons_female
AS
SELECT id, name, age, gender, address
  FROM person
 WHERE gender = 'female';