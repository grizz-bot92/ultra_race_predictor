CREATE TABLE strava_data(
	name varchar(255),
	distance FLOAT,
	moving_time INTEGER,
	elapsed_time INTEGER,
	total_elevation_gain FLOAT,
	sport_type VARCHAR(50),
	start_date TIMESTAMP,
	timezone VARCHAR (50),
	average_speed FLOAT,
	max_speed FLOAT,
	average_cadence FLOAT,
	average_heartrate FLOAT,
	max_heartrate INTEGER,
	elev_high FLOAT,
	elev_low FLOAT,
	suffer_score INTEGER,
	average_temp FLOAT
);

COPY strava_data(name, distance, moving_time,	elapsed_time, total_elevation_gain, sport_type, start_date, timezone, average_speed, max_speed, average_cadence, average_heartrate, max_heartrate, elev_high,	elev_low, suffer_score,	average_temp)
FROM 'C:\public\strava_activities.csv'
DELIMITER ','
CSV HEADER;