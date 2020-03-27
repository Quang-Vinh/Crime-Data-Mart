-- Number of crimes per city and day compared to moving average of 3 months
select t.city, t.full_date, total, avg(total) over w as movavg
from
(
    select l.city, d.full_date, count(*) as total 
    from 
        "CrimeDataMart".crime_fact as f 
        inner join 
        "CrimeDataMart".location_dimension as l 
        on l.location_dim_key = f.location_dim_key
        inner join 
        "CrimeDataMart".date_dimension as d 
        on d.date_dim_key = f.date_dim_key
    group by l.city, d.full_date
) as t 
window w as (partition by city
             order by full_date 
             range between  '1 week' preceding
             and '1 week' following)


-- Number of crimes per offense category per year compared to moving average of 3 years
select t.offense_category, t.year, total, avg(total) over w as movavg 
from 
(
    select c.offense_category, d.year, count(*) as total 
    from 
        "CrimeDataMart".crime_fact as f 
        inner join 
        "CrimeDataMart".crime_dimension as c 
        on c.crime_dim_key = f.crime_dim_key
        inner join 
        "CrimeDataMart".date_dimension as d 
        on d.date_dim_key = f.date_dim_key
    group by c.offense_category, d.year
) as t 
window w as (partition by offense_category
             order by t.year
             range between 1 preceding
             and 1 following)