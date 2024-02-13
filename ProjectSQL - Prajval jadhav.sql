show variables like 'secure_file_priv';


create database athletes;
use athletes;

create table olympics(
ID int,
Name varchar(400),	
Sex	char(2), 
Age	int, 
Height	int, 
Weight	int, 
Team varchar(400),	
NOC	varchar(400),
Games varchar(400),
Year int,
Season	varchar(400), 
City varchar(400), 
Sport varchar(400),	
Event varchar(400),
Medal varchar(200));

select * from olympics;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/Athletes_Cleaned.csv'
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select count(*) from olympics;

-- SQL PROJECT

-- 1. Show how many medal counts present for entire data

select medal, count(medal) as medalcount
from olympics
group by medal;


-- 2. Show count of unique sports present in Olympics
select sport, count(sport) as sportcount
from olympics
group by sport;

-- 3. Show how many different medals won by team India

select team, medal, count(*) from olympics
where team ='india'
group by medal;




-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select  team, event, count(*) as medalcount
from olympics
where team='india' and medal<>'nomedal'
group by event
order by medalcount desc;




-- 5. Show event wise medals won by India in order of year

select year, event, count(*)
from olympics
where team='india' and medal<>'nomedal'
group by year, event
order by year;


-- 6. show country who won maximum medals.
select team, count(*) as maxmedal from olympics
where medal <> 'nomedal'
group by team
order by maxmedal desc
limit 1;

-- 7.show top 10 countries whowon gold

select team, count(*) as maxgold from olympics
where medal = 'gold'
group by team
order by maxgold desc
limit 7;

--  8. show in which year did United states won most gold medal
select team, year, count(*) as maxgold from olympics
where medal = 'gold' and team = 'united states'
group by year
order by maxgold desc
limit 1;

-- 9. In which sports United States has most medals.

select team, sport, count(*) as mostmedal from olympics
where medal <> 'nomedal' and team = 'united states'
group by sport
order by mostmedal desc
limit 1;

-- 10. Find top three players who won most medals along with their sports and country

select name, sport, team, count(*) as mostmedal from olympics
where medal <> 'nomedal'
group by name, team, sport
order by mostmedal desc
limit 3;



-- 11. Find player with most gold medals in cycling along with his country.

select name, sport, team, count(*) as mostgold from olympics
where medal = 'gold' and sport = 'cycling'
group by name, sport, team
order by mostgold desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

select name, sport, team, count(*) as mostmedal from olympics
where medal <> 'nomedal' and sport ='basketball'
group by name, team, sport
order by mostmedal desc
limit 1;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select medal, count(*) from olympics
where name ='teresa edwards'
group by medal;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select sex, year, count(*) as medalcount from olympics
where medal <> 'nomedal'
group by sex, year
order by year;
