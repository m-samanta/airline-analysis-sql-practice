-- 3. What is the average delay time per airline?

-- Find the avg departure delays by airline

SELECT
    airline,
    ROUND(AVG(departure_delay), 2) AS avg_departure_delay
FROM
    flights
GROUP BY
    airline;

-- Find the avg arrival delays by airline

SELECT
    airline,
    ROUND(AVG(arrival_delay), 2) AS avg_arrival_delay
FROM
    flights
GROUP BY
    airline;

-- Find the overall avg delays by airline

WITH avg_departure AS (
    SELECT 
        airline,
        ROUND(AVG(departure_delay), 2) AS avg_departure_delay
    FROM 
        flights
    GROUP BY 
        airline
),
avg_arrival AS (
    SELECT 
        airline,
        ROUND(AVG(arrival_delay), 2) AS avg_arrival_delay
    FROM 
        flights
    GROUP BY 
        airline
)
SELECT 
    d.airline,
    d.avg_departure_delay,
    a.avg_arrival_delay,
    ROUND((d.avg_departure_delay + a.avg_arrival_delay) / 2, 2) AS avg_overall_delay
FROM 
    avg_departure d
JOIN 
    avg_arrival a ON d.airline = a.airline;