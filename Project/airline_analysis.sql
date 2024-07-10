-- Analyze airline performance data to understand flight delays, cancellations, and factors affecting on-time performance.
-- You will extract, transform, and load (ETL) the data, perform SQL queries for data analysis, and create an interactive dashboard in Power BI to present your findings.

-- 1. CREATE DATABASE airline_analysis

CREATE DATABASE airline_analysis;

-- 2. CREATE APPROPRIATE TABLES WITH APPROPRIATE KEYS

CREATE TABLE airlines (
    IATA_CODE VARCHAR(2),
    AIRLINE VARCHAR(255)
);

CREATE TABLE airports (
    IATA_CODE VARCHAR(3),
    AIRPORT VARCHAR(255),
    CITY VARCHAR(255),
    STATE VARCHAR(2),
    COUNTRY VARCHAR(3),
    LATITUDE NUMERIC,
    LONGITUDE NUMERIC
);

CREATE TABLE flights (
    YEAR INT,
    MONTH INT,
    DAY INT,
    DAY_OF_WEEK INT,
    AIRLINE VARCHAR(2),
    FLIGHT_NUMBER INT,
    TAIL_NUMBER VARCHAR(6),
    ORIGIN_AIRPORT TEXT,
    DESTINATION_AIRPORT TEXT,
    SCHEDULED_DEPARTURE INT,
    DEPARTURE_TIME NUMERIC,
    DEPARTURE_DELAY NUMERIC,
    TAXI_OUT NUMERIC,
    WHEELS_OFF NUMERIC,
    SCHEDULED_TIME NUMERIC,
    ELAPSED_TIME NUMERIC,
    AIR_TIME NUMERIC,
    DISTANCE INT,
    WHEELS_ON NUMERIC,
    TAXI_IN NUMERIC,
    SCHEDULED_ARRIVAL INT,
    ARRIVAL_TIME NUMERIC,
    ARRIVAL_DELAY NUMERIC,
    DIVERTED INT,
    CANCELLED INT,
    CANCELLATION_REASON VARCHAR(1),
    AIR_SYSTEM_DELAY NUMERIC,
    SECURITY_DELAY NUMERIC,
    AIRLINE_DELAY NUMERIC,
    LATE_AIRCRAFT_DELAY NUMERIC,
    WEATHER_DELAY NUMERIC
);

-- 3. SET OWNERSHIP TO THE RIGHT USER

ALTER TABLE airlines OWNER to REDACTED;
ALTER TABLE airports OWNER to REDACTED;
ALTER TABLE flights OWNER to REDACTED;

-- 4. IMPORT DATA FROM CSV

/*
Due to permission issues, this step is handled directly through pgAdmin
\copy airlines FROM 'FILEPATH\airlines.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy airports FROM 'FILEPATH\airports.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy flights FROM 'FILEPATH\flights.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/
