--Group by country and order by no. of fans
SELECT
    origin,
    SUM(nb_fans) as nb_fans
FROM
    metal_bands
GROUP BY
    origin
ORDER BY
    nb_fans DESC;