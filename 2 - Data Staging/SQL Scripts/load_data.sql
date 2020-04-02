set schema 'CrimeDataMart'; 

--  psql -h www.eecs.uottawa.ca -p 15432 -d group_42 -U qdo086 -f load_data.sql

-- Load Dimensions

\copy date_dimension(full_date, day, month, year, day_of_year, week_of_year, weekday, is_weekend, quarter, is_month_start, is_month_end, is_year_start, is_year_end, is_can_holiday, can_holiday_name, is_us_holiday, us_holiday_name, date_dim_key) from 'D:\OneDrive\Projects\School\CSI 4142\CSI4142_project\data\dimensional_model\date_dimension.csv' delimiter ',' csv header;

\copy location_dimension( location, neighborhood, latitude, longitude, city, crime_rate, location_dim_key) from 'D:\OneDrive\Projects\School\CSI 4142\CSI4142_project\data\dimensional_model\location_dimension.csv' delimiter ',' csv header;

\copy event_dimension(location, city, name, type, location_size, event_dim_key) from 'D:\OneDrive\Projects\School\CSI 4142\CSI4142_project\data\dimensional_model\event_dimension.csv' delimiter ',' csv header;

\copy crime_dimension(first_occurrence_time, last_occurrence_time, reported_time, offense_type, offense_category, is_violent, crime_dim_key) from 'D:\OneDrive\Projects\School\CSI 4142\CSI4142_project\data\dimensional_model\crime_dimension.csv' delimiter ',' csv header;


-- Fact table

\copy crime_fact(is_traffic, is_fatal, is_nighttime, date_dim_key, crime_dim_key, location_dim_key, event_dim_key) from 'D:\OneDrive\Projects\School\CSI 4142\CSI4142_project\data\dimensional_model\crimes_fact.csv' delimiter ',' csv header;

