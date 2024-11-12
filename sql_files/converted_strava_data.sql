CREATE TABLE converted_strava_data AS
SELECT
	name,
	distance * 0.000621371 AS distance_miles,
	moving_time / 60.0 AS moving_time_mins,
	elapsed_time / 60.0 AS elapsed_time_mins,
	total_elevation_gain * 3.28084 AS elevation_gain_feet,
	sport_type,
	start_date,
	timezone,
	average_speed * 2.23694 AS avg_speed_mph,
	max_speed * 2.23694 AS max_speed_mph,
	average_cadence,
	average_heartrate,
	max_heartrate,
	elev_high * 3.28084 AS elev_high_feet,
	elev_low * 3.28084 AS elev_low_feet,
	suffer_score,
	average_temp * 9/5 + 32 AS avg_temp_fh
FROM
	strava_data;

UPDATE converted_strava_data
SET distance_miles = ROUND(distance_miles::numeric, 2),
	moving_time_mins = ROUND(moving_time_mins, 2),
	elapsed_time_mins = ROUND(elapsed_time_mins, 2),
	elevation_gain_feet = ROUND(elevation_gain_feet::numeric, 2),
	avg_speed_mph = ROUND(avg_speed_mph::numeric, 2),
	max_speed_mph = ROUND(max_speed_mph::numeric, 2),
	elev_high_feet = ROUND(elev_high_feet::numeric, 2),
	elev_low_feet = ROUND(elev_low_feet::numeric, 2)

ALTER TABLE converted_strava_data
DROP COLUMN timezone;