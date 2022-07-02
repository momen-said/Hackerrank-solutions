 --------------------------------   HACKERRANK QUESTIONS AND THEIR SOLUTIONS   -------------------------------------------
 -------------------------------------------------------------------------------------------------------------------------
 -- 1 -- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
 select * from city where population > 100000 and countrycode = 'USA'
 -- 2 -- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
 select name from city where population > 120000 and countrycode = 'USA'
 -- 3 -- Query all columns (attributes) for every row in the CITY table.
 select * from city
 -- 4 -- Query all columns for a city in CITY with the ID 1661.
 select * from city where id = 1661
 -- 5 -- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
 select * from city where countrycode ='JPN' 
 -- 6 -- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
  select name from city where countrycode ='JPN' 
 -- 7 -- Query a list of CITY and STATE from the STATION table.
 select city, state from station
 -- 8 -- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
 select distinct city from station where id%2 = 0
 -- 9 -- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
 select count(city) - count(distinct(city)) from station
 -- 10 -- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
 --(i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
select top 1 city, len(city) from station order by len(city), city;
select top 1 city, len(city) from station order by len(city) desc;
 -- 11 -- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
 select distinct city from station where city like 'a%' or city like 'e%'or city like 'i%'or city like 'o%'or city like 'u%'
 -- 12 -- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
 select distinct city from station where city like '%a' or city like '%e'or city like '%i'or city like '%o'or city like '%u'
 -- 13 -- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
 -- Your result cannot contain duplicates.
SELECT distinct city FROM station WHERE city LIKE '[a,e,i,o,u]%' AND city LIKE '%[a,e,i,o,u]'
 -- 14 -- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
 SELECT distinct city FROM station WHERE city not LIKE '[a,e,i,o,u]%'
 -- 15 -- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
 SELECT distinct city FROM station WHERE city not LIKE '%[a,e,i,o,u]'
 -- 16 -- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
 SELECT distinct city FROM station WHERE city not LIKE '[a,e,i,o,u]%' or city not LIKE '%[a,e,i,o,u]'
 -- 17 -- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
 SELECT distinct city FROM station WHERE city not LIKE '[a,e,i,o,u]%' and city not LIKE '%[a,e,i,o,u]'
 -- 18 -- Query the Euclidean Distance between 2 points  and  and format your answer to display  decimal digits.
 select format(sqrt((square(max(lat_n)-min(lat_n))) + (square(max(long_w)-min(long_w)))), '000.0000') from station
 -- 19 -- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
 -- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
 select name from students where marks > 75 order by substring(name,len(name)-2,3), id
 -- 20 -- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
 select name from employee order by name 
 -- 21 -- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee 
 -- having a salary greater than  per month who have been employees for less than 10  months. Sort your result by ascending employee_id.
 select name from employee where salary > 2000 and months < 10 order by employee_id
 -- 22 -- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
/*Output one of the following statements for each record in the table:
Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.*/
select 
case 
	when A + B <= C or A + C <= B or B + C <= A then 'Not A Triangle'
	when A = B and B = C then 'Equilateral'
	when A = B or B = C or A = C then 'Isosceles'
	else 'Scalene'
end
from TRIANGLES
 -- 23 -- Query a count of the number of cities in CITY having a Population larger than 100000 
 select count(name) from city where population > 100000
 -- 24 -- Query the total population of all cities in CITY where District is California.
 select sum(population) from city where district = 'California'
 -- 25 -- Query the average population of all cities in CITY where District is California.
 select avg(population) from city where district = 'California'
 -- 26 -- Query the average population for all cities in CITY, rounded down to the nearest integer.
 select round(avg(population),0) from city 
 -- 27 -- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
 select sum(population) from city where countrycode = 'JPN'
 -- 28 -- Query the difference between the maximum and minimum populations in CITY.
 select max(population) - min(population) from city
 -- 29 -- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
/*but did not realize her keyboard's  key was broken until after completing the calculation. 
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.*/
select cast(ceiling((avg(cast(Salary AS Float)) - avg(cast(replace(Salary, 0, '')AS Float)))) AS INT) from employees
-- 30 -- We define an employee's total earnings to be their monthly  worked, 
/*and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. */
select top 1 salary*months, count(salary*months) from employee
group by salary*months
order by count(salary*months) desc
-- 31 -- Query the The sum of all values in LAT_N rounded to 2 decimal places and The sum of all values in LONG_W rounded to 2 decimal places.
Select format(sum(LAT_N),'000.00'),format(sum(LONG_W),'000.00') from station
-- 32 -- uery the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345, Truncate your answer to 4 decimals
Select format(sum(LAT_N),'000.0000') from station where LAT_N between 38.7880 and 137.2345
-- 33 -- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 . Truncate your answer to 4 decimal places.
Select format(max(LAT_N),'000.0000') from station where LAT_N < 137.2345
-- 34 -- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345, Round your answer to 4 decimals
Select format(LONG_W,'000.0000') from station where LAT_N in (select max(LAT_N) from station where LAT_N < 137.2345)
-- 35 -- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880. Round your answer to 4 decimal places.
Select format(min(LAT_N),'00.0000') from station where LAT_N > 38.7780
-- 36 -- Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7880 . Round your answer to 4 decimals
Select format(LONG_W,'00.0000') from station where LAT_N in (select min(LAT_N) from station where LAT_N > 38.7780)
-- 37 -- Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.
select format((max(LAT_N)-min(LAT_N))+(max(LONG_W)-min(LONG_W)) ,'00.0000') from station
-- 38 -- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
select sum(y.population) from city y
inner join country c on y.countrycode = c.code
where continent = 'Asia'
-- 39 -- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
select y.name from city y
inner join country c on y.countrycode = c.code
where continent = 'Africa'
-- 40 -- Given the CITY and COUNTRY tables, query the names of all the continents and their respective average city populations rounded down to the nearest integer.
select c.continent, round(avg(y.population),0) from city y
inner join country c on y.countrycode = c.code
group by c.continent
-- 41 -- Generate the following two result sets:
/*Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession enclosed in parentheses
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
There are a total of [occupation_count] [occupation]s.*/
select name + '('+substring(occupation,1,1)+')' from occupations order by name
select 'There are a total of ' + cast(count(occupation) as varchar) +' '+ lower(occupation) + 's.' from occupations
group by occupation 
order by cast(count(occupation) as varchar), occupation
-- 42 -- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
--The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
SELECT [Doctor], [Professor], [Singer], [Actor]
FROM
(SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME)as row_number, * FROM OCCUPATIONS) as temp
PIVOT
(MAX(name) FOR OCCUPATION IN ([Doctor], [Professor], [Singer], [Actor])) as pivot1
