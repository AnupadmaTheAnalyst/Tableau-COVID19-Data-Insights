use portfolioproject;
show tables;
select count(*) from portfolioproject.coviddeaths;
select count(*) from portfolioproject.covidvaccinations;
select * from portfolioproject.coviddeaths;
select * from portfolioproject.covidvaccinations;
show columns from coviddeaths;
show columns from covidvaccinations;

/*Queries used for Tableau Visualization*/
/*1*/
select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths)/sum(new_cases))*100 as Death_Percentage
from portfolioproject.coviddeaths
/*where location like '%india%'*/
where continent is not null
/*group by date*/
order by 1,2;

/*Just a double check based on the data provided
Numbers are extremely close so we will keep them-The second includes 'International' location*/

/*select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths)/sum(new_cases))*100 as Death_Percentage
from portfolioproject.coviddeaths
where location like '%india%'
where location='World'
group by date
order by 1,2*/

/*2*/
/*We take these out as they are not included in the above queries and want to stay consistent*/
/*European Union is part of Europe*/

select location, sum(new_deaths) as total_death_count
from portfolioproject.coviddeaths
/*where location like '%india%'*/
where continent is null and location not in ('World', 'European Union', 'International')
group by location
order by total_death_count desc;

/*3*/

select Location, population, max(total_cases) as Highest_Infection_Count, max((total_cases/population))*100 as PopulationInfected_Percentage
from portfolioproject.coviddeaths
/*where location like '%india%'*/
group by Location, population
order by PopulationInfected_Percentage desc;

/*4*/

select Location, population, date, max(total_cases) as Highest_Infection_Count, max((total_cases/population))*100 as PopulationInfected_Percentage
from portfolioproject.coviddeaths
/*where location like '%india%'*/
group by Location, population, date
order by PopulationInfected_Percentage desc;




