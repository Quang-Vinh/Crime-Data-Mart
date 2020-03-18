
-- Total number of crimes during a year 2016 in vancouver per neighborhoods
select l.neighborhood, count(*)
from 
    "CrimeDataMart"."crime_fact" as f 
    inner join 
    "CrimeDataMart"."location_dimension" as l 
    on l.location_dim_key = f.location_dim_key  
    inner join 
    "CrimeDataMart"."date_dimension" as d 
    on d.date_dim_key = f.date_dim_key
where l.city = 'Vancouver' and d.year = 2016
group by l.neighborhood

-- Total number of crimes during 2016 on January per offense cateogry
select c.offense_category, count(*)
from 
    "CrimeDataMart"."crime_fact" as f 
    inner join 
    "CrimeDataMart"."date_dimension" as d 
    on d.date_dim_key = f.date_dim_key
    inner join 
    "CrimeDataMart"."crime_dimension" as c 
    on c.crime_dim_key = f.crime_dim_key
where d.year = 2016 and d.month = 1 
group by c.offense_category

