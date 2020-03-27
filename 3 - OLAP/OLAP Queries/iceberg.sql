-- Locations in Denver with highest occurences of Burglary per year
select l.neighborhood, l.location, d.year, count(*) as total
from 
    "CrimeDataMart".crime_fact as f 
    inner join 
    "CrimeDataMart".location_dimension as l 
    on l.location_dim_key = f.location_dim_key
    inner join 
    "CrimeDataMart".crime_dimension as c 
    on c.crime_dim_key = f.crime_dim_key
    inner join 
    "CrimeDataMart".date_dimension as d 
    on d.date_dim_key = f.date_dim_key
where l.city = 'Vancouver' and c.offense_category = 'Burglary'
group by l.neighborhood, l.location, d.year
order by total desc 
limit 10

-- Highest crime occurences in Vancouver grouped by year, canadian holidays and offense category
 select d.year, d.can_holiday_name, c.offense_category, count(*) as total
 from 
    "CrimeDataMart".crime_fact as f 
    inner join 
    "CrimeDataMart".location_dimension as l 
    on l.location_dim_key = f.location_dim_key
    inner join 
    "CrimeDataMart".date_dimension as d 
    on d.date_dim_key = f.date_dim_key
    inner join 
    "CrimeDataMart".crime_dimension as c 
    on c.crime_dim_key = f.crime_dim_key
where l.city = 'Vancouver' and d.can_holiday_name is not null
group by d.year, d.can_holiday_name, c.offense_category
order by total desc
limit 15