--
--
-- ALL QUERIES PERFORMED USING MYSQL



SELECT NOW ()

--Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY 
FROM STATION 
WHERE RIGHT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U');

/*

SELECT DISTINCT CITY 
FROM STATION 
WHERE city REGEXP '[^aeiou]$';

*/

--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[^aeiou]|[^aeiou]$';

/*

SELECT DISTINCT city
FROM station
WHERE LEFT(city,1) NOT IN ('a','e','i','o','u') OR RIGHT (city,1) NOT IN ('a','e','i','o','u');

*/

--Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[^aeiou]' AND city REGEXP '[^aeiou]$';

/*

SELECT DISTINCT city
FROM station
WHERE LEFT(city,1) NOT IN ('a','e','i','o','u') AND RIGHT (city,1) NOT IN ('a','e','i','o','u');

*/

--Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT name
FROM students
WHERE marks > 75
ORDER BY RIGHT(name,3), id ASC;

--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name
FROM employee
ORDER BY name;

--Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

SELECT name
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;

--Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

SELECT
    CASE
        WHEN a>=b+c or b>=a+c or c>=b+a THEN 'Not A Triangle'
        WHEN a=b and b=c THEN 'Equilateral'
        WHEN a=b or b=c or a=c THEN 'Isosceles'
        ELSE 'Scalene'
    END AS 'Type'
FROM triangles;

--1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

--2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: There are a total of [occupation_count] [occupation]s. Where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

SELECT CONCAT(name,'(',LEFT(occupation,1),')') 
FROM occupations 
ORDER BY name;

SELECT CONCAT('There are a total of', ' ',COUNT(occupation),' ',CONCAT(LOWER(occupation),'s.'))
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation), occupation;