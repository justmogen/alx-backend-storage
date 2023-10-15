--Create a temporary table to store the results
CREATE TEMPORARY TABLE tmp_results (origin VARCHAR(255), nb_fans INT);

--Calculate the number of non-unique fans for each country origin and rank them
INSERT INTO
    tmp_results (origin, nb_fans)
SELECT
    origin,
    COUNT(DISTINCT band_name) as nb_fans
FROM
    metal_bands
GROUP BY
    origin
ORDER BY
    nb_fans DESC;