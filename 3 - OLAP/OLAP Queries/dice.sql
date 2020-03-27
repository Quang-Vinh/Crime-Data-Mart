-- Number crimes per city, neighborhood for selected offense categories for 2018
select l.city, l.neighborhood, c.offense_category, count(*)
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
where d.year = 2018 and c.offense_category in ('All Other Crimes', 'Murder', 'Robbery', 'Larceny', 'Public Disorder')
group by l.city, l.neighborhood, c.offense_category

-- Number of crimes per offense category for certain year period in Denver
select c.offense_category, c.offense_type, d.year, count(*)
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
where l.city = 'Denver' and d.year between 2016 and 2018
group by c.offense_category, c.offense_type, d.year

