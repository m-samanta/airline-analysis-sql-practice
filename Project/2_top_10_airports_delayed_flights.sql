--1. What are the top 10 airports with the highest number of delayed flights?

SELECT origin_airport, COUNT(*) AS delayed_flights_count
FROM flights 
WHERE departure_delay IS NOT NULL
AND departure_delay > 0
GROUP BY origin_airport
ORDER BY delayed_flights_count DESC
limit 10;
