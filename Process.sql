-- Data Processing -- 

-- Identifying NULL values -- 

SELECT * FROM dbo.Cycle_Data
WHERE 
ride_id IS NULL
OR rideable_type IS NULL
OR started_at IS NULL
OR ended_at IS NULL
OR start_station_id is NULL
OR start_station_name IS NULL
OR end_station_id is NULL
OR end_station_name IS NULL
OR member_casual IS NULL;

-- 1430071 rows with null values --
-- removing NULL values --

DELETE FROM dbo.Cycle_Data
WHERE 
ride_id is NULL
OR rideable_type is NULL
OR started_at is NULL
OR ended_at is NULL
OR start_station_id is NULL
OR start_station_name IS NULL
OR end_station_id is NULL
OR end_station_name is NULL
OR member_casual is NULL;

----- 1430071 rows removed ----

-- Identifying and removing Duplicate rows -- 

WITH CTE AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY ride_id, rideable_type, started_at, ended_at, start_station_id, start_station_name, end_station_id, end_station_name, member_casual 
            ORDER BY (SELECT NULL)  -- No specific ordering; just need row numbering
        ) AS row_num
    FROM 
        dbo.[Cycle_Data]
)
DELETE FROM CTE
WHERE row_num > 1;

-- 148284 duplicate rows were removed -- 

SELECT * FROM dbo.Cycle_Data

-- now we have 4331823 rows in our dataset -- 

-- checking for invalid date-time entries --

SELECT * FROM dbo.Cycle_Data
WHERE started_at > ended_at;

DELETE FROM dbo.Cycle_Data
WHERE started_at > ended_at;

-- 66 rows removed --

SELECT * FROM dbo.Cycle_Data
WHERE started_at = ended_at;

-- we have 503 rows in dataset with smae start time and end time, this is weird. in can be possible due to multiple reasons - Data entry error, System Glitch in logging time, unsuccessful ride, cancelled ride. ----

SELECT DISTINCT start_station_name FROM dbo.Cycle_Data;
SELECT DISTINCT start_station_id FROM dbo.Cycle_Data;

SELECT DISTINCT end_station_name FROM dbo.Cycle_Data;

--- Trim whitespaces ---
UPDATE dbo.Cycle_Data
SET start_station_name = LTRIM(RTRIM(start_station_name)),
    end_station_name = LTRIM(RTRIM(end_station_name));

-- Making sure that station names are consistent --

UPDATE dbo.Cycle_Data
SET start_station_name = UPPER(start_station_name),
    end_station_name = UPPER(end_station_name);



ALTER TABLE dbo.Cycle_Data
DROP COLUMN start_station_id;

ALTER TABLE dbo.Cycle_Data
DROP COLUMN end_station_id;

-- create new column named ride_length --
ALTER TABLE dbo.Cycle_Data
ADD ride_length AS DATEDIFF(MINUTE, started_at, ended_at);

SELECT ride_length, ride_length/60 as ride_hours, ride_length%60 as ride_minutes
FROM dbo.Cycle_Data

-- create new column named day_of_week to get weekday --
ALTER TABLE dbo.Cycle_Data
ADD day_of_week as DATEPART(WEEKDAY, started_at);


SELECT * FROM Cycle_Data;