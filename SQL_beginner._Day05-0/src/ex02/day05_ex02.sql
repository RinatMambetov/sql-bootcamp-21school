CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name));

SET ENABLE_SEQSCAN TO off;

EXPLAIN ANALYSE
SELECT name
  FROM person
 WHERE UPPER(name) = UPPER('Denis')