USE EMP_DB;

create  or alter view domestic_visitors as
select case when district in  ('Warangal (Urban)','Warangal (Rural)') then 'Warangal' else district end as district,
date,CASE 
        WHEN month = 'January' THEN 1
        WHEN month = 'February' THEN 2
        WHEN month = 'March' THEN 3
        WHEN month = 'April' THEN 4
        WHEN month = 'May' THEN 5
        WHEN month = 'June' THEN 6
        WHEN month = 'July' THEN 7
        WHEN month = 'August' THEN 8
        WHEN month = 'September' THEN 9
        WHEN month = 'October' THEN 10
        WHEN month = 'November' THEN 11
        WHEN month = 'December' THEN 12
    END AS MonthNumber,year,visitors from dbo.domestic_visitors_2016
union all
select case when district in  ('Warangal (Urban)','Warangal (Rural)') then 'Warangal' else district end as district,
date,CASE 
        WHEN month = 'January' THEN 1
        WHEN month = 'February' THEN 2
        WHEN month = 'March' THEN 3
        WHEN month = 'April' THEN 4
        WHEN month = 'May' THEN 5
        WHEN month = 'June' THEN 6
        WHEN month = 'July' THEN 7
        WHEN month = 'August' THEN 8
        WHEN month = 'September' THEN 9
        WHEN month = 'October' THEN 10
        WHEN month = 'November' THEN 11
        WHEN month = 'December' THEN 12
    END AS MonthNumber,year,visitors from dbo.domestic_visitors_2017
union all
select case when district in  ('Warangal (Urban)','Warangal (Rural)') then 'Warangal' else district end as district,
date,CASE 
        WHEN month = 'January' THEN 1
        WHEN month = 'February' THEN 2
        WHEN month = 'March' THEN 3
        WHEN month = 'April' THEN 4
        WHEN month = 'May' THEN 5
        WHEN month = 'June' THEN 6
        WHEN month = 'July' THEN 7
        WHEN month = 'August' THEN 8
        WHEN month = 'September' THEN 9
        WHEN month = 'October' THEN 10
        WHEN month = 'November' THEN 11
        WHEN month = 'December' THEN 12
    END AS MonthNumber,year,visitors from dbo.domestic_visitors_2018
union all
select case when district in  ('Warangal (Urban)','Warangal (Rural)') then 'Warangal' else district end as district,
date,CASE 
        WHEN month = 'January' THEN 1
        WHEN month = 'February' THEN 2
        WHEN month = 'March' THEN 3
        WHEN month = 'April' THEN 4
        WHEN month = 'May' THEN 5
        WHEN month = 'June' THEN 6
        WHEN month = 'July' THEN 7
        WHEN month = 'August' THEN 8
        WHEN month = 'September' THEN 9
        WHEN month = 'October' THEN 10
        WHEN month = 'November' THEN 11
        WHEN month = 'December' THEN 12
    END AS MonthNumber,year,visitors from dbo.domestic_visitors_2019;


create  or alter view foreign_visitors as
select case when district in  ('Warangal (Urban)','Warangal (Rural)') then 'Warangal' else district end as district,
date,CASE 
        WHEN month = 'January' THEN 1
        WHEN month = 'February' THEN 2
        WHEN month = 'March' THEN 3
        WHEN month = 'April' THEN 4
        WHEN month = 'May' THEN 5
        WHEN month = 'June' THEN 6
        WHEN month = 'July' THEN 7
        WHEN month = 'August' THEN 8
        WHEN month = 'September' THEN 9
        WHEN month = 'October' THEN 10
        WHEN month = 'November' THEN 11
        WHEN month = 'December' THEN 12
    END AS MonthNumber,year,visitors from dbo.foreign_visitors_2016
union all
select case when district in  ('Warangal (Urban)','Warangal (Rural)') then 'Warangal' else district end as district,
date,CASE 
        WHEN month = 'January' THEN 1
        WHEN month = 'February' THEN 2
        WHEN month = 'March' THEN 3
        WHEN month = 'April' THEN 4
        WHEN month = 'May' THEN 5
        WHEN month = 'June' THEN 6
        WHEN month = 'July' THEN 7
        WHEN month = 'August' THEN 8
        WHEN month = 'September' THEN 9
        WHEN month = 'October' THEN 10
        WHEN month = 'November' THEN 11
        WHEN month = 'December' THEN 12
    END AS MonthNumber,year,visitors from dbo.foreign_visitors_2017
union all
select case when district in  ('Warangal (Urban)','Warangal (Rural)') then 'Warangal' else district end as district,
date,CASE 
        WHEN month = 'January' THEN 1
        WHEN month = 'February' THEN 2
        WHEN month = 'March' THEN 3
        WHEN month = 'April' THEN 4
        WHEN month = 'May' THEN 5
        WHEN month = 'June' THEN 6
        WHEN month = 'July' THEN 7
        WHEN month = 'August' THEN 8
        WHEN month = 'September' THEN 9
        WHEN month = 'October' THEN 10
        WHEN month = 'November' THEN 11
        WHEN month = 'December' THEN 12
    END AS MonthNumber,year,visitors from dbo.foreign_visitors_2018
union all
select case when district in  ('Warangal (Urban)','Warangal (Rural)') then 'Warangal' else district end as district,
date,CASE 
        WHEN month = 'January' THEN 1
        WHEN month = 'February' THEN 2
        WHEN month = 'March' THEN 3
        WHEN month = 'April' THEN 4
        WHEN month = 'May' THEN 5
        WHEN month = 'June' THEN 6
        WHEN month = 'July' THEN 7
        WHEN month = 'August' THEN 8
        WHEN month = 'September' THEN 9
        WHEN month = 'October' THEN 10
        WHEN month = 'November' THEN 11
        WHEN month = 'December' THEN 12
    END AS MonthNumber,year,visitors from dbo.foreign_visitors_2019;








---Query1
select top(10) district,sum(visitors) as total_visitors from domestic_visitors group by district order by sum(visitors) desc;


---Query2
with cte_to_find_start_year as(
select district,min(year) as min_year,min(MonthNumber) as min_month from domestic_visitors group by district
),
cte_begin_value_year as(
select cte_to_find_start_year.district,cte_to_find_start_year.min_year,sum(domestic_visitors.visitors) as begin_value_year from 
cte_to_find_start_year inner join domestic_visitors on 
cte_to_find_start_year.district=domestic_visitors.district and cte_to_find_start_year.min_year=domestic_visitors.year group by cte_to_find_start_year.district
,cte_to_find_start_year.min_year
),
cte_begin_value_month as(
select cte_to_find_start_year.district,cte_to_find_start_year.min_month,sum(domestic_visitors.visitors) as begin_value_month from 
cte_to_find_start_year inner join domestic_visitors on 
cte_to_find_start_year.district=domestic_visitors.district and cte_to_find_start_year.min_year=domestic_visitors.year group by cte_to_find_start_year.district
,cte_to_find_start_year.min_month
),
cte_to_find_end_year as(
select district,max(year) as max_year,max(MonthNumber) as max_month from domestic_visitors group by district
),
cte_end_value_year as(
select cte_to_find_end_year.district,cte_to_find_end_year.max_year,sum(domestic_visitors.visitors) as end_value_year from cte_to_find_end_year inner join domestic_visitors on 
cte_to_find_end_year.district=domestic_visitors.district and cte_to_find_end_year.max_year=domestic_visitors.year group by cte_to_find_end_year.district,
cte_to_find_end_year.max_year
),
cte_end_value_month as(
select cte_to_find_end_year.district,cte_to_find_end_year.max_month,sum(domestic_visitors.visitors) as end_value_month from cte_to_find_end_year inner join domestic_visitors on 
cte_to_find_end_year.district=domestic_visitors.district and cte_to_find_end_year.max_year=domestic_visitors.year group by cte_to_find_end_year.district,
cte_to_find_end_year.max_month
)
select top(3) cte_begin_value_year.district, case when (cte_end_value_year.max_year-cte_begin_value_year.min_year)!=0 then round(power(1.0*end_value_year/nullif(begin_value_year,0),1.0/(max_year-min_year))-1,2)*100 
else round(power(1.0*end_value_month/nullif(begin_value_month,0),1.0/(cte_end_value_month.max_month-cte_begin_value_month.min_month))-1,2)*100 end as cagr
from cte_end_value_year inner join cte_begin_value_year
on cte_end_value_year.district=cte_begin_value_year.district
inner join cte_begin_value_month
on cte_end_value_year.district=cte_begin_value_month.district
inner join cte_end_value_month
on cte_end_value_year.district=cte_end_value_month.district
where case when (cte_end_value_year.max_year-cte_begin_value_year.min_year)!=0 then round(power(1.0*end_value_year/nullif(begin_value_year,0),1.0/(max_year-min_year))-1,2) 
else round(power(1.0*end_value_month/nullif(begin_value_month,0),1.0/(cte_end_value_month.max_month-cte_begin_value_month.min_month))-1,2) end is not null
order by case when (cte_end_value_year.max_year-cte_begin_value_year.min_year)!=0 then round(power(1.0*end_value_year/nullif(begin_value_year,0),1.0/(max_year-min_year))-1,2) 
else round(power(1.0*end_value_month/nullif(begin_value_month,0),1.0/(cte_end_value_month.max_month-cte_begin_value_month.min_month))-1,2) end desc;


---Query3
with cte_to_find_start_year as(
select district,min(year) as min_year,min(MonthNumber) as min_month from domestic_visitors group by district
),
cte_begin_value_year as(
select cte_to_find_start_year.district,cte_to_find_start_year.min_year,sum(domestic_visitors.visitors) as begin_value_year from 
cte_to_find_start_year inner join domestic_visitors on 
cte_to_find_start_year.district=domestic_visitors.district and cte_to_find_start_year.min_year=domestic_visitors.year group by cte_to_find_start_year.district
,cte_to_find_start_year.min_year
),
cte_begin_value_month as(
select cte_to_find_start_year.district,cte_to_find_start_year.min_month,sum(domestic_visitors.visitors) as begin_value_month from 
cte_to_find_start_year inner join domestic_visitors on 
cte_to_find_start_year.district=domestic_visitors.district and cte_to_find_start_year.min_year=domestic_visitors.year group by cte_to_find_start_year.district
,cte_to_find_start_year.min_month
),
cte_to_find_end_year as(
select district,max(year) as max_year,max(MonthNumber) as max_month from domestic_visitors group by district
),
cte_end_value_year as(
select cte_to_find_end_year.district,cte_to_find_end_year.max_year,sum(domestic_visitors.visitors) as end_value_year from cte_to_find_end_year inner join domestic_visitors on 
cte_to_find_end_year.district=domestic_visitors.district and cte_to_find_end_year.max_year=domestic_visitors.year group by cte_to_find_end_year.district,
cte_to_find_end_year.max_year
),
cte_end_value_month as(
select cte_to_find_end_year.district,cte_to_find_end_year.max_month,sum(domestic_visitors.visitors) as end_value_month from cte_to_find_end_year inner join domestic_visitors on 
cte_to_find_end_year.district=domestic_visitors.district and cte_to_find_end_year.max_year=domestic_visitors.year group by cte_to_find_end_year.district,
cte_to_find_end_year.max_month
)
select top(3) cte_begin_value_year.district, case when (cte_end_value_year.max_year-cte_begin_value_year.min_year)!=0 then round(power(1.0*end_value_year/nullif(begin_value_year,0),1.0/(max_year-min_year))-1,2)*100 
else round(power(1.0*end_value_month/nullif(begin_value_month,0),1.0/(cte_end_value_month.max_month-cte_begin_value_month.min_month))-1,2)*100 end as cagr
from cte_end_value_year inner join cte_begin_value_year
on cte_end_value_year.district=cte_begin_value_year.district
inner join cte_begin_value_month
on cte_end_value_year.district=cte_begin_value_month.district
inner join cte_end_value_month
on cte_end_value_year.district=cte_end_value_month.district
where case when (cte_end_value_year.max_year-cte_begin_value_year.min_year)!=0 then round(power(1.0*end_value_year/nullif(begin_value_year,0),1.0/(max_year-min_year))-1,2) 
else round(power(1.0*end_value_month/nullif(begin_value_month,0),1.0/(cte_end_value_month.max_month-cte_begin_value_month.min_month))-1,2) end is not null
order by case when (cte_end_value_year.max_year-cte_begin_value_year.min_year)!=0 then round(power(1.0*end_value_year/nullif(begin_value_year,0),1.0/(max_year-min_year))-1,2) 
else round(power(1.0*end_value_month/nullif(begin_value_month,0),1.0/(cte_end_value_month.max_month-cte_begin_value_month.min_month))-1,2) end ;


--Query 4
with cte_peak_month as(
select district,rank() over(order by sum_of_visitors desc) as p_rnk, monthnumber,sum_of_visitors 
from(
select district,monthnumber,sum(visitors) as sum_of_visitors from domestic_visitors where district='Hyderabad' group by district,monthnumber
)x
),
cte_low_month as(
select district,rank() over(order by sum_of_visitors asc) as l_rnk,MonthNumber,sum_of_visitors
from(
select district,monthnumber,sum(visitors) as sum_of_visitors from domestic_visitors where district='Hyderabad' group by district,monthnumber
)x
) 

select CASE 
        WHEN cte_peak_month.monthnumber = 1 THEN 'January'
        WHEN cte_peak_month.monthnumber = 2 THEN 'February'
        WHEN cte_peak_month.monthnumber = 3 THEN 'March'
        WHEN cte_peak_month.monthnumber = 4 THEN 'April'
        WHEN cte_peak_month.monthnumber = 5 THEN 'May'
        WHEN cte_peak_month.monthnumber = 6 THEN 'June'
        WHEN cte_peak_month.monthnumber = 7 THEN 'July'
        WHEN cte_peak_month.monthnumber = 8 THEN 'August'
        WHEN cte_peak_month.monthnumber = 9 THEN 'September'
        WHEN cte_peak_month.monthnumber = 10 THEN 'October'
        WHEN cte_peak_month.monthnumber = 11 THEN 'November'
        WHEN cte_peak_month.monthnumber = 12 THEN 'December'
    END as peak_season_months,
	cte_peak_month.sum_of_visitors as total_visitors_in_peak_season_months,
CASE 
        WHEN cte_low_month.monthnumber = 1 THEN 'January'
        WHEN cte_low_month.monthnumber = 2 THEN 'February'
        WHEN cte_low_month.monthnumber = 3 THEN 'March'
        WHEN cte_low_month.monthnumber = 4 THEN 'April'
        WHEN cte_low_month.monthnumber = 5 THEN 'May'
        WHEN cte_low_month.monthnumber = 6 THEN 'June'
        WHEN cte_low_month.monthnumber = 7 THEN 'July'
        WHEN cte_low_month.monthnumber = 8 THEN 'August'
        WHEN cte_low_month.monthnumber = 9 THEN 'September'
        WHEN cte_low_month.monthnumber = 10 THEN 'October'
        WHEN cte_low_month.monthnumber = 11 THEN 'November'
        WHEN cte_low_month.monthnumber = 12 THEN 'December'
    END as low_season_months,
	cte_low_month.sum_of_visitors as total_visitors_in_low_season_months
	from cte_peak_month join cte_low_month on cte_peak_month.district=cte_low_month.district 
where p_rnk in (1,2,3) and l_rnk in (1,2,3) and p_rnk=l_rnk;


--Query 5

with cte_df_ratio as(
select d.district,sum(d.visitors)/nullif(sum(f.visitors),0) as domestic_foreign_vis_ratio from domestic_visitors d inner join foreign_visitors f
on d.district=f.district
group by d.district,f.district
),
cte_high_df_ratio as(
select district as district_with_high_df_ratio,domestic_foreign_vis_ratio,rank() over(order by domestic_foreign_vis_ratio desc ) as h_rnk from cte_df_ratio 
where domestic_foreign_vis_ratio is not null
),
cte_low_df_ratio as(
select district as district_with_low_df_ratio,domestic_foreign_vis_ratio,rank() over(order by domestic_foreign_vis_ratio asc ) as l_rnk from cte_df_ratio 
where domestic_foreign_vis_ratio is not null
)
select top(3) district_with_high_df_ratio,cte_high_df_ratio.domestic_foreign_vis_ratio as high_df_ratio,
district_with_low_df_ratio,cte_low_df_ratio.domestic_foreign_vis_ratio as low_df_ratio
from cte_high_df_ratio inner join cte_low_df_ratio on 
cte_high_df_ratio.h_rnk=cte_low_df_ratio.l_rnk;


create view population_data_view as
select district,Population as population from dbo.population_data;


select * from population_data_view;

---Query 6
with cte_pv_ratio as(
select population_data_view.district,round(sum(visitors)/sum(population),2) as pop_footfall_ratio  from domestic_visitors join population_data_view on 
domestic_visitors.district=population_data_view.district
group by population_data_view.district,domestic_visitors.year
having domestic_visitors.year=2019
),
high_pop_footfall_ratio as(
select district,pop_footfall_ratio,rank() over(order by pop_footfall_ratio desc) as rnk from cte_pv_ratio
),
low_pop_footfall_ratio as(
select district,pop_footfall_ratio,rank() over(order by pop_footfall_ratio asc) as rnk from cte_pv_ratio
)
select top(3) h.district as districts_with_high_pf_ratio,h.pop_footfall_ratio as high_pop_footfall_ratio,l.district as district_with_low_pf_ratio,
l.pop_footfall_ratio as low_pop_footfall_ratio from high_pop_footfall_ratio h join low_pop_footfall_ratio l
on h.rnk=l.rnk;



---Query 7 

with dom_cte as(
select x.district,round((sum_vis_end_year*
power( (1+ (power (y.sum_vis_end_year*1.0/ x.sum_vis_start_year,1.0/ (y.year-x.year) )-1)*100),(2025-y.year)
))/1000000000,2)
as projected_number_of_dom_visitors_in_2025_cal_billion
from (
select district,year,sum(visitors) as sum_vis_start_year from domestic_visitors where district='Hyderabad' and year=2016 group by district,year
)x join 
(
select district,year,sum(visitors) as sum_vis_end_year from domestic_visitors where district='Hyderabad' and year=2019 group by district,year
)y on x.district=y.district
),
for_cte as(
select a.district,
round((b.sum_vis_end_year*power( (1+ (( power(b.sum_vis_end_year*1.0/ a.sum_vis_start_year,1.0/ (b.year-a.year) )-1) *100)) ,(2025-b.year)))/1000000000,2)
as projected_number_of_for_visitors_in_2025_cal_billion
from(
select district,year,sum(visitors) as sum_vis_start_year from foreign_visitors where district='Hyderabad' and year=2016 group by district,year
)a inner join
(
select district,year,sum(visitors) as sum_vis_end_year from foreign_visitors where district='Hyderabad' and year=2019 group by district,year
) b on a.district=b.district
)
select for_cte.district,projected_number_of_dom_visitors_in_2025_cal_billion,projected_number_of_for_visitors_in_2025_cal_billion 
from dom_cte join for_cte on dom_cte.district=for_cte.district;

---Query 8

with dom_cte_rev as(
select x.district,round((sum_vis_end_year*
power( (1+ (power (y.sum_vis_end_year*1.0/ x.sum_vis_start_year,1.0/ (y.year-x.year) )-1)*100),(2025-y.year)
))/1000000000,2)*1200
as projected_rev_of_dom_visitors_in_2025_cal_billion
from (
select district,year,sum(visitors) as sum_vis_start_year from domestic_visitors where district='Hyderabad' and year=2016 group by district,year
)x join 
(
select district,year,sum(visitors) as sum_vis_end_year from domestic_visitors where district='Hyderabad' and year=2019 group by district,year
)y on x.district=y.district
),
for_cte_rev as(
select a.district,
round((b.sum_vis_end_year*power( (1+ (( power(b.sum_vis_end_year*1.0/ a.sum_vis_start_year,1.0/ (b.year-a.year) )-1) *100)) ,(2025-b.year)
))/1000000000,2)*5600
as projected_rev_of_for_visitors_in_2025_cal_billion
from(
select district,year,sum(visitors) as sum_vis_start_year from foreign_visitors where district='Hyderabad' and year=2016 group by district,year
)a inner join
(
select district,year,sum(visitors) as sum_vis_end_year from foreign_visitors where district='Hyderabad' and year=2019 group by district,year
) b on a.district=b.district
)
select for_cte_rev.district,projected_rev_of_dom_visitors_in_2025_cal_billion,projected_rev_of_for_visitors_in_2025_cal_billion 
from dom_cte_rev join for_cte_rev on dom_cte_rev.district=for_cte_rev.district;
