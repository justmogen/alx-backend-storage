--Glam rock style
SELECT
    band_name,
    IFNULL (YEAR ('2022-01-01') - YEAR (born), 0) + IFNULL (YEAR ('2022-01-01') - YEAR (disbanded), 0) AS lifespan
FROM
    metal_bands
WHERE
    style = 'Glam rock'
ORDER BY
    lifespan DESC;