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
-- 43 -- You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
/*Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.*/
select case 
   when P is null then concat(n,' Root')
   when N in (select distinct p from bst) then concat(n,' Inner')
   else concat(n,' Leaf')
end
from BST order by N
-- 44 -- Given the table schemas below (represents a hierarchy), write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, 
-- total number of managers, and total number of employees. Order your output by ascending company_code.
select 
c.company_code,
c.founder, 
count(distinct e.lead_manager_code),
count(distinct e.senior_manager_code),
count(distinct e.manager_code),
count(distinct e.employee_code)
from company c
inner join employee e
on c.company_code = e.company_code
group by c.company_code,c.founder
order by c.company_code
-- 45 -- You are given two tables: Students and Grades. 
/*Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade 
If there is more than one student with the same grade (8-10) assigned to them, 
order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
Write a query to help Eve.*/
select  iif(grade < 8,null, name), grade, marks
from Students
inner join grades 
on marks between min_mark and max_mark
order by grade desc, name
-- another solution:
select case
   when grade < 8 then null
   else name
end , grade, marks
from Students
inner join grades on marks between min_mark and max_mark
order by grade desc, name
-- 46 -- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
select top 1 format(PERCENTILE_CONT(0.5) within group (order by LAT_N desc) over(),'00.0000') as median
from station
-- 47 -- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
/*Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.*/
select h.hacker_id, h.name
from submissions s
inner join challenges c 
on s.challenge_id = c.challenge_id
inner join hackers h 
on s.hacker_id = h.hacker_id
inner join difficulty d
on c.difficulty_level = d.difficulty_level 
where s.score = d.score
group by h.hacker_id, h.name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, h.hacker_id
-- 48 -- Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
/*Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age.
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.*/
select w.id, p.age, w.coins_needed, w.power
from wands w
inner join Wands_Property p
on w.code = p.code
where is_evil = 0 and w.coins_needed in 
(select min(coins_needed) from Wands w1 
join Wands_Property p1 on w1.code = p1.code 
where w1.power = w.power and p1.age = p.age) 
order by w.power desc, p.age desc
-- another solution:
with harry_potter as
(select w.id, p.age, w.coins_needed, w.power,
row_number() over(PARTITION BY W.code, W.power ORDER BY W.coins_needed, W.power DESC) AS RowNumber
from wands w
inner join Wands_Property p on W.code = p.code
WHERE p.is_evil = 0)
select id, age, coins_needed, power
from harry_potter
where RowNumber = 1
order by power desc, age desc
-- 49 -- Julia asked her students to create some coding challenges. 
/*Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created,
then exclude those students from the result.*/
select h.hacker_id, h.name, count(c.challenge_id) as count
from hackers h
inner join challenges c
on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having count(c.challenge_id) in 
(select max(cnt.count) 
from (select count(hacker_id) AS count from challenges group by hacker_id) cnt)
or count(c.challenge_id) in
(select cnt.count
from (select count(hacker_id) AS count from challenges group by hacker_id) cnt
group by cnt.count
having count (cnt.count) = 1)
order by count(c.challenge_id) desc, h.hacker_id
-- 50 -- You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
/*It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.
If the End_Date of the tasks are consecutive, then they are part of the same project. 
Samantha is interested in finding the total number of different projects completed.
Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
If there is more than one project that have the same number of completion days, then order by the start date of the project.*/
with CTE_Projects as
(select start_date, end_date, row_number() over(order by start_date) as rownumber
 from projects)
select min(start_date), max(end_date) 
from CTE_Projects
group by datediff(day, rownumber, end_date)
order by DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)), min(start_date)
-- 51 -- You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
/*Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.*/
select s.name
from students s
inner join friends f
on s.id = f.id
inner join packages p1
on s.id = p1.id
inner join packages p2
on f.friend_id = p2.id
where p1.salary < p2.salary
order by p2.salary
-- 52 -- 
