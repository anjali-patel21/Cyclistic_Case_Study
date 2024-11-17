-- Data Analysis --

-- analysing how many casual or member rides are there --
SELECT member_casual, COUNT(*) as no_of_rides
FROM dbo.Cycle_Data
GROUP BY member_casual;

-- no. of rides for each type of bike and membership status --

SELECT COUNT(ride_id) as no_of_rides, rideable_type, member_casual 
FROM dbo.Cycle_Data
GROUP BY rideable_type, member_casual
ORDER BY no_of_rides DESC;

-- Most Popular Start Station -- 
SELECT TOP 10 COUNT(ride_id) as no_of_rides, start_station_name, member_casual
FROM dbo.Cycle_Data
GROUP BY start_station_name, member_casual
ORDER BY no_of_rides DESC;

-- Most Popular End Station --
SELECT TOP 10 COUNT(ride_id) as no_of_rides, end_station_name, member_casual
FROM dbo.Cycle_Data
GROUP BY end_station_name, member_casual
ORDER BY no_of_rides DESC;

-- Most Popular Month --
SELECT COUNT(ride_id) as no_of_rides, DATEPART(MONTH, started_at) as month_of_year, member_casual
FROM dbo.Cycle_Data
GROUP BY DATEPART(MONTH, started_at), member_casual
ORDER BY no_of_rides DESC; 

-- Average ride length by user type --
SELECT COUNT(ride_id) as no_of_rides, member_casual, AVG(ride_length) as avg_ride_length
FROM dbo.Cycle_Data
GROUP BY member_casual
ORDER BY no_of_rides DESC

-- Ride by Day of week --
SELECT member_casual, day_of_week, COUNT(ride_id) AS total_rides
FROM dbo.Cycle_Data
GROUP BY member_casual, day_of_week
ORDER BY total_rides DESC;

-- Popular Station for casual riders --
SELECT TOP 20 start_station_name, COUNT(ride_id) as no_of_rides
FROM dbo.Cycle_Data
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY no_of_rides DESC;

-- Popular Station for member riders --
SELECT TOP 20 start_station_name, COUNT(ride_id) as no_of_rides
FROM dbo.Cycle_Data
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY no_of_rides DESC;

-- Busiest Hour of the day --
SELECT COUNT(ride_id) as total_rides, DATEPART(HOUR, started_at) as started_hour, member_casual
FROM dbo.Cycle_Data
GROUP BY DATEPART(HOUR, started_at), member_casual
ORDER BY total_rides DESC;

-- Busiest Hour of the day by casual riders --
SELECT COUNT(ride_id) as total_rides, DATEPART(HOUR, started_at) as started_hour
FROM dbo.Cycle_Data
WHERE member_casual = 'casual'
GROUP BY DATEPART(HOUR, started_at)
ORDER BY total_rides DESC;

-- Busiest Hour of the day by members --
SELECT COUNT(ride_id) as total_rides, DATEPART(HOUR, started_at) as started_hour
FROM dbo.Cycle_Data
WHERE member_casual = 'member'
GROUP BY DATEPART(HOUR, started_at)
ORDER BY total_rides DESC;

-- Weekend Vs Weekday Comparison --
SELECT member_casual, 
       CASE 
           WHEN day_of_week IN ('7', '1') THEN 'Weekend'
           ELSE 'Weekday'
       END AS ride_period,
       COUNT(ride_id) AS total_rides
FROM dbo.Cycle_Data
GROUP BY member_casual,  CASE 
           WHEN day_of_week IN ('7', '1') THEN 'Weekend'
           ELSE 'Weekday'
       END
ORDER BY total_rides DESC;

-- Ride length distribution for casual riders --
SELECT CASE
           WHEN ride_length < 15 THEN '<15 minutes'
           WHEN ride_length BETWEEN 15 AND 30 THEN '15-30 minutes'
           WHEN ride_length BETWEEN 31 AND 60 THEN '31-60 minutes'
           ELSE '>60 minutes'
       END AS ride_length_category,
       COUNT(ride_id) AS total_rides
FROM dbo.Cycle_Data
WHERE member_casual = 'casual'
GROUP BY CASE
           WHEN ride_length < 15 THEN '<15 minutes'
           WHEN ride_length BETWEEN 15 AND 30 THEN '15-30 minutes'
           WHEN ride_length BETWEEN 31 AND 60 THEN '31-60 minutes'
           ELSE '>60 minutes'
       END 
ORDER BY total_rides DESC;


-- Ride length distribution for member riders --
SELECT CASE
           WHEN ride_length < 15 THEN '<15 minutes'
           WHEN ride_length BETWEEN 15 AND 30 THEN '15-30 minutes'
           WHEN ride_length BETWEEN 31 AND 60 THEN '31-60 minutes'
           ELSE '>60 minutes'
       END AS ride_length_category,
       COUNT(ride_id) AS total_rides
FROM dbo.Cycle_Data
WHERE member_casual = 'member'
GROUP BY CASE
           WHEN ride_length < 15 THEN '<15 minutes'
           WHEN ride_length BETWEEN 15 AND 30 THEN '15-30 minutes'
           WHEN ride_length BETWEEN 31 AND 60 THEN '31-60 minutes'
           ELSE '>60 minutes'
       END 
ORDER BY total_rides DESC;

-- Round Trip Vs. One way Trip --

SELECT member_casual, 
       CASE 
           WHEN start_station_name = end_station_name THEN 'Round Trip'
           ELSE 'One-Way Trip'
       END AS trip_type,
       COUNT(ride_id) AS total_rides
FROM dbo.Cycle_Data
GROUP BY member_casual,   CASE 
           WHEN start_station_name = end_station_name THEN 'Round Trip'
           ELSE 'One-Way Trip'
       END
ORDER BY total_rides DESC;

-- this is a comment to check... --


