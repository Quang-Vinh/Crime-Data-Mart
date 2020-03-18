
-- Crimes per category type per city on March 2016
select l.city, c.offense_category, count(*)
from 
    "CrimeDataMart"."crime_fact" as f 
    inner join 
    "CrimeDataMart"."location_dimension" as l 
    on l.location_dim_key = f.location_dim_key  
    inner join 
    "CrimeDataMart"."date_dimension" as d 
    on d.date_dim_key = f.date_dim_key
    inner join 
    "CrimeDataMart"."crime_dimension" as c 
    on c.crime_dim_key = f.crime_dim_key
where d.month = 3 and d.year = 2016
group by l.city, c.offense_category

-- Crimes per category and year and month in Vancouver
select d.year, d.month, c.offense_category, count(*)
from 
    "CrimeDataMart"."crime_fact" as f 
    inner join 
    "CrimeDataMart"."date_dimension" as d 
    on d.date_dim_key = f.date_dim_key
    inner join 
    "CrimeDataMart"."location_dimension" as l 
    on l.location_dim_key = f.location_dim_key
    inner join 
    "CrimeDataMart"."crime_dimension" as c 
    on c.crime_dim_key = f.crime_dim_key
where l.city = 'Vancouver'
group by d.year, d.month, c.offense_category