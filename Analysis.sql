# cyclistic

-- Analyze

--  total rides by membership type

SELECT membership_type, count(*) AS amount_of_rides
   FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
   GROUP BY membership_type

-- rides by month

CREATE TABLE `glassy-chalice-421712.Cyclistic.2023_2024_rides_by_month` AS 
(SELECT membership_type, month, year, count(*) AS num_of_rides
FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
GROUP BY membership_type, year, month
ORDER BY membership_type, year)

-- rides by day

CREATE TABLE `glassy-chalice-421712.Cyclistic.2023_2024_rides_by_day` AS 
(SELECT membership_type, day_of_week, count(*) AS num_of_rides
FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
GROUP BY membership_type, day_of_week
ORDER BY membership_type)

-- rides by hour

CREATE TABLE `glassy-chalice-421712.Cyclistic.2023_2024_rides_by_hour` AS 
(SELECT membership_type, EXTRACT(HOUR from start_time) AS hour, count(*) AS num_of_rides
FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
GROUP BY membership_type, hour
ORDER BY membership_type, hour)

-- average ride duration by month

CREATE TABLE `glassy-chalice-421712.Cyclistic.2023_2024_avg_by_month` AS 
(SELECT membership_type, month, ROUND(AVG(duration_minutes)) AS average_duration
FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
GROUP BY membership_type, month)

-- average ride duration by day

CREATE TABLE `glassy-chalice-421712.Cyclistic.2023_2024_avg_by_day` AS 
(SELECT membership_type, day_of_week, ROUND(AVG(duration_minutes)) AS average_duration
FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
GROUP BY membership_type, day_of_week)

-- average ride duration by hour
  
CREATE TABLE `glassy-chalice-421712.Cyclistic.2023_2024_avg_by_hour` AS 
(SELECT membership_type, EXTRACT (HOUR from start_time) AS hour, ROUND(AVG(duration_minutes)) AS average_duration
FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
GROUP BY membership_type, hour
ORDER BY membership_type, hour)

-- start locations

CREATE TABLE `glassy-chalice-421712.Cyclistic.2023_2024_start_rides` AS 
(SELECT start_station_name, membership_type,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
GROUP BY start_station_name, membership_type)

-- end locations

CREATE TABLE `glassy-chalice-421712.Cyclistic.2023_2024_end_rides` AS 
SELECT end_station_name, membership_type,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM `glassy-chalice-421712.Cyclistic.2023_2024_combined_trips_cleaned`
GROUP BY end_station_name, membership_type
