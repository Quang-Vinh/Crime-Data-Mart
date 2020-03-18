
-- Number of crimes on a holiday grouped by offense category and city
select c.offense_category, l.city, count(*), grouping(l.city, c.offense_category)
from 
    "CrimeDataMart"."crime_fact" as f 
    inner join 
    "CrimeDataMart"."location_dimension" as l 
    on l.location_dim_key = f.location_dim_key 
    inner join 
    "CrimeDataMart"."crime_dimension" as c 
    on c.crime_dim_key = f.crime_dim_key
    inner join 
    "CrimeDataMart"."date_dimension" as d 
    on d.date_dim_key = f.date_dim_key
where d.is_can_holiday is not null or d.is_us_holiday is not null 
group by rollup(l.city, c.offense_category)
order by l.city, c.offense_category


-- Number of crimes that occured on an event between 2016-2018 per neighborhood and city
select l.city, l.neighborhood, count(*)
from 
    "CrimeDataMart".crime_fact as f 
    inner join 
    "CrimeDataMart".event_dimension as e 
    on e.event_dim_key = f.event_dim_key
    inner join 
    "CrimeDataMart".date_dimension as d 
    on d.date_dim_key = f.date_dim_key 
    inner join 
    "CrimeDataMart".location_dimension as l 
    on l.location_dim_key = f.location_dim_key
where e.name != 'No Event' and d.year between 2016 and 2018
group by l.city, l.neighborhood
order by l.city, l.neighborhood