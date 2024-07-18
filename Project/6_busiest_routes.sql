-- 5. What are the top 10 busiest airports (origin and destination separately) in terms of number of flights?

--Top 10 busiest airports by origin

SELECT
    origin_airport,
    COUNT(*) AS count_origin_airport
FROM
    flights
GROUP BY
    origin_airport
ORDER BY
    count_origin_airport DESC
LIMIT 10;

--Top 10 busiest airports by destination

SELECT
    destination_airport,
    COUNT(*) AS count_destination_airport
FROM
    flights
GROUP BY
    destination_airport
ORDER BY
    count_destination_airport DESC
LIMIT 10;