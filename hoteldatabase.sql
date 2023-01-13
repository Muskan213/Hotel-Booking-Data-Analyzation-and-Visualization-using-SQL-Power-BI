#Create Database to Analyze and Visualize Hotel Booking Data

Create Database project;

use project;


#combine all data tables into one table

create view hotels as(
select * from data2018 
union
select * from data2019 
union
select * from data2020);


#Checking if the revenue is growing over the years or not by hotel type

select arrival_date_year,hotel,
round(sum(stays_in_week_nights+stays_in_weekend_nights)*adr,2)
as revenue from hotels group by arrival_date_year,hotel;
 
 
#joining table hotels,market and meal 

select * from hotels as h left join market as m on
h.market_segment=m.market_segment
left join meal on h.meal=meal.meal group by arrival_date_year,hotel;

