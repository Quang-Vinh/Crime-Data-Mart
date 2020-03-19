-- Number of crimes grouped by offense category and year
select d.year, c.offense_category, grouping(d.year, c.offense_category), count(*)
from 
    "CrimeDataMart"."crime_fact" as f 
    inner join 
    "CrimeDataMart"."date_dimension" as d 
    on d.date_dim_key = f.date_dim_key
    inner join 
    "CrimeDataMart"."crime_dimension" as c 
    on c.crime_dim_key = f.crime_dim_key
group by rollup(d.year, c.offense_category)
order by d.year, c.offense_category

-- Number of crimes grouped by quarter and neighbourhood
select l.neighborhood,  d.quarter, grouping(d.quarter, l.neighborhood), count(*)
from 
    "CrimeDataMart"."crime_fact" as f 
    inner join 
    "CrimeDataMart"."date_dimension" as d 
    on d.date_dim_key = f.date_dim_key 
    inner join 
    "CrimeDataMart"."location_dimension" as l 
    on l.location_dim_key = f.location_dim_key
group by rollup(d.quarter, l.neighborhood)
order by d.quarter, l.neighborhood

