-- Dataset Preparation -- 

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
INTO dbo.dataset
FROM dbo.[2023_Jan]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Feb]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Mar]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Apr]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_May]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Jun]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Jul]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Aug]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Sep]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Jan]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Oct]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Nov]
UNION ALL

SELECT 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual,
start_lat,
start_lng,
end_lat,
end_lng
FROM dbo.[2023_Dec]

