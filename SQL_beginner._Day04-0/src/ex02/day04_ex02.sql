CREATE VIEW v_generated_dates
AS
SELECT generated_date::DATE
  FROM GENERATE_SERIES('2022-01-01', '2022-01-31', INTERVAL '1 day') AS generated_date
 ORDER BY generated_date;