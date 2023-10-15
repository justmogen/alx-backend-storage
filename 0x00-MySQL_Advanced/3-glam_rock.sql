--Glam rock style
SELECT
    band_name,
    IFNULL (2022 - SUBSTRING_INDEX (formed, '-', 1), 0) + IFNULL (2022 - SUBSTRING_INDEX (split, '-', 1), 0) AS lifespan
FROM
    metal_bands
WHERE
    style = 'Glam rock'
ORDER BY
    lifespan DESC;