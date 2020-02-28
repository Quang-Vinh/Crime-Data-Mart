set schema 'CrimeDataMart';


-- Dimension tables

create table date_dimension (
    date_dim_key serial not null,
    full_date date,
    day int,
    month int,
    year int,
    day_of_year int, 
    week_of_year int,
    weekday int,
    is_weekend boolean,
    quarter int,
    is_month_start boolean,
    is_month_end boolean,
    is_year_start boolean,
    is_year_end boolean,
    is_can_holiday boolean,
    can_holiday_name varchar,
    is_us_holiday boolean,
    us_holiday_name varchar,
    primary key (date_dim_key)
);

create table location_dimension (
    location_dim_key serial not null,
    location varchar,
    neighborhood varchar,
    latitude float,
    longitude float,
    city varchar,
    crime_rate float,
    primary key (location_dim_key)
);

create table crime_dimension (
    crime_dim_key serial not null,
    first_occurrence_time time without time zone,
    last_occurrence_time time without time zone,
    reported_time time without time zone,
    offense_type varchar,
    offense_category varchar,
    is_violent boolean,
    primary key (crime_dim_key)
);

create table event_dimension (
    event_dim_key serial not null,
    location varchar,
    city varchar,
    name varchar,
    type varchar,
    location_size int,
    primary key (event_dim_key)
);


-- Fact table

create table crime_fact (
    date_dim_key int,
    location_dim_key int,
    crime_dim_key int,
    event_dim_key int,
    is_traffic boolean,
    is_fatal boolean,
    is_nighttime boolean,
    primary key (date_dim_key, location_dim_key, crime_dim_key, event_dim_key),
    foreign key (date_dim_key) references date_dimension(date_dim_key),
    foreign key (location_dim_key) references location_dimension(location_dim_key),
    foreign key (crime_dim_key) references crime_dimension(crime_dim_key),
    foreign key (event_dim_key) references event_dimension(event_dim_key)
);