--2. Which airlines have the best and worst on-time performance?

--Find on-time departure performance (within 15 mins of scheduled)

SELECT 
    airline,
    COUNT(*) AS total_departed_flights,
    SUM(CASE WHEN departure_delay BETWEEN -15 AND 15 THEN 1 ELSE 0 END) AS on_time_departures,
    ROUND((COUNT(CASE WHEN departure_delay BETWEEN -15 AND 15 THEN 1 END) * 100.0 / COUNT(*)), 2) AS on_time_departures_percentage
FROM 
    flights
GROUP BY 
    on_time_departures_percentage;

--Find on-time arrival performance (within 15 mins of scheduled)

SELECT 
    airline,
    COUNT(*) AS total_arrived_flights,
    SUM(CASE WHEN arrival_delay BETWEEN -15 AND 15 THEN 1 ELSE 0 END) AS on_time_arrivals,
    ROUND((COUNT(CASE WHEN arrival_delay BETWEEN -15 AND 15 THEN 1 END) * 100.0 / COUNT(*)), 2) AS on_time_arrivals_percentage
FROM 
    flights
GROUP BY 
    airline;

--Find overall on-time performance based on the two above

WITH on_time_departures AS (
    SELECT 
        airline,
        COUNT(*) AS total_flights,
        SUM(CASE WHEN departure_delay BETWEEN -15 AND 15 THEN 1 ELSE 0 END) AS on_time_departures,
        ROUND((COUNT(CASE WHEN departure_delay BETWEEN -15 AND 15 THEN 1 END) * 100.0 / COUNT(*)), 2) AS on_time_departures_percentage
    FROM 
        flights
    GROUP BY 
        airline
),
on_time_arrivals AS (
    SELECT 
        airline,
        COUNT(*) AS total_flights,
        SUM(CASE WHEN arrival_delay BETWEEN -15 AND 15 THEN 1 ELSE 0 END) AS on_time_arrivals,
        ROUND((COUNT(CASE WHEN arrival_delay BETWEEN -15 AND 15 THEN 1 END) * 100.0 / COUNT(*)), 2) AS on_time_arrivals_percentage
    FROM 
        flights
    GROUP BY 
        airline
)
SELECT 
    d.airline,
    d.on_time_departures_percentage,
    a.on_time_arrivals_percentage,
    ROUND((d.on_time_departures_percentage + a.on_time_arrivals_percentage) / 2, 2) AS overall_on_time_percentage
FROM 
    on_time_departures d
JOIN 
    on_time_arrivals a ON d.airline = a.airline
ORDER BY 
    overall_on_time_percentage DESC;
