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
