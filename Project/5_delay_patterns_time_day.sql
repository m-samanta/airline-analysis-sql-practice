-- 4. Are there any patterns in delays based on the day of the week?


WITH avg_departure AS (
    SELECT 
        day_of_week,
        ROUND(AVG(departure_delay), 2) AS avg_departure_delay
    FROM 
        flights
    GROUP BY 
        day_of_week
    ORDER BY 
        day_of_week
),
avg_arrival AS (
    SELECT 
        day_of_week,
        ROUND(AVG(arrival_delay), 2) AS avg_arrival_delay
    FROM 
        flights
    GROUP BY 
        day_of_week
    ORDER BY 
        day_of_week
)
SELECT 
    d.day_of_week,
    d.avg_departure_delay,
    a.avg_arrival_delay,
    ROUND((d.avg_departure_delay + a.avg_arrival_delay) / 2, 2) AS avg_overall_delay
FROM 
    avg_departure d
JOIN 
    avg_arrival a ON d.day_of_week = a.day_of_week
ORDER BY 
    d.day_of_week;
