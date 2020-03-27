-- Neighborhoods with total number of crimes per month and averaged per year
select t.neighborhood, t.year, t.month, total, avg(t.total) over w
from
(
    select l.neighborhood, d.year, d.month, count(*) as total
    from 
        "CrimeDataMart".crime_fact as f 
        inner join 
        "CrimeDataMart".location_dimension as l 
        on l.location_dim_key = f.location_dim_key
        inner join 
        "CrimeDataMart".date_dimension as d 
        on d.date_dim_key = f.date_dim_key
    group by l.neighborhood, d.year, d.month
) t
window w as (partition by neighborhood, year)

-- Offense categories total number of crimes per quarter and averaged per year
select t.offense_category, t.year, t.quarter, t.total, avg(t.total) over w 
from 
(
    select c.offense_category, d.year, d.quarter, count(*) as total 
    from 
        "CrimeDataMart".crime_fact as f 
        inner join 
        "CrimeDataMart".crime_dimension as c 
        on c.crime_dim_key = f.crime_dim_key
        inner join 
        "CrimeDataMart".date_dimension as d 
        on d.date_dim_key = f.date_dim_key
    group by c.offense_category, d.year, d.quarter
) t
window w as (partition by offense_category, year order by quarter)
