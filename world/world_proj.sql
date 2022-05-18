USE world;

-- Using COUNT, get the number of cities in the USA.
SELECT COUNT(CountryCode) AS NumberOfUSCities 
FROM city 
WHERE CountryCode='USA';

-- Find out the population and life expectancy for people in Argentina.
SELECT Name, LifeExpectancy, Population 
FROM country 
WHERE Code = 'ARG';

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT Name, LifeExpectancy 
FROM country 
WHERE LifeExpectancy IS NOT NULL  
ORDER BY LifeExpectancy DESC 
LIMIT 1;

-- Using JOIN ... ON, find the capital city of Spain.
SELECT country.Name AS Country, city.Name AS Capital 
FROM country 
INNER JOIN city 
ON country.capital=city.ID 
WHERE country.Name='Spain';

-- Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT DISTINCT country.Region AS Region, countrylanguage.Language AS `Language Spoken` 
FROM country 
INNER JOIN countrylanguage 
ON countrylanguage.CountryCode=country.Code 
WHERE country.region="Southeast Asia";

-- Using a single query, list 25 cities around the world that start with the letter F.
SELECT Name AS City 
FROM city 
WHERE Name LIKE 'F%' 
LIMIT 25;

-- Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT country.Name AS Country, COUNT(countrycode) AS `Number of Cities` 
FROM city 
INNER JOIN country 
ON country.code=city.CountryCode 
WHERE countrycode='CHN';

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT Name AS Country, Population 
FROM country 
WHERE Population IS NOT NULL 
ORDER BY Population ASC 
LIMIT 1;

-- Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(Code) AS `Number of Countries` 
FROM country;

-- What are the top ten largest countries by area?
SELECT Name AS Country, SurfaceArea AS `Surface Area` 
FROM country 
ORDER BY SurfaceArea DESC 
LIMIT 10;

-- List the five largest cities by population in Japan.
SELECT Name AS City, Population FROM city 
WHERE CountryCode=(
    SELECT Code FROM country
    WHERE Name = 'Japan'
) 
ORDER BY Population DESC LIMIT 5;

-- List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
/* Fixed Mistake for Head of State
UPDATE country 
SET HeadOfState='Elizabeth II'
WHERE HeadOfState='Elisabeth II';
SELECT * FROM country;*/

SELECT Name AS Country, Code AS `Country Code`
FROM country 
WHERE HeadOfState = 'Elizabeth II';

-- List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT Name AS Country, Population/SurfaceArea AS `Population:Surface Ratio`
FROM country
WHERE Population/SurfaceArea > 0
ORDER BY `Population:Surface Ratio`
LIMIT 10;

-- List every unique world language.
SELECT DISTINCT Language AS `World Languages` FROM countrylanguage
ORDER BY `World Languages` ASC;

-- List the names and GNP of the world's top 10 richest countries.
SELECT Name AS Country, GNP 
FROM country
ORDER BY GNP DESC
LIMIT 10;

-- List the names of, and number of languages spoken by, the top ten most multilingual countries.
SELECT c.Name AS Country, COUNT(cl.Language) AS `Number of Languages Spoken` 
FROM countrylanguage cl
INNER JOIN country c ON c.code=cl.CountryCode
GROUP BY c.Name
ORDER BY COUNT(cl.language) DESC
LIMIT 10;

-- List every country where over 50% of its population can speak German.
SELECT c.Name AS Country, cl.Percentage 
FROM countrylanguage cl
INNER JOIN country c ON c.code=cl.CountryCode
WHERE Language ='German' AND Percentage > 50
ORDER BY Percentage DESC;

-- Which country has the worst life expectancy? Discard zero or null values.
SELECT Name AS Country, LifeExpectancy AS `Life Expectancy`
FROM country
WHERE LifeExpectancy IS NOT NULL AND LifeExpectancy > 0
ORDER BY LifeExpectancy ASC
LIMIT 1;

-- List the top three most common government forms.
SELECT COUNT(GovernmentForm) AS `Number of Governments`, GovernmentForm
FROM country
GROUP BY GovernmentForm
ORDER BY COUNT(GovernmentForm) DESC
LIMIT 3;

-- How many countries have gained independence since records began?
SELECT COUNT(IndepYear) AS `Number of Independant Countries` 
FROM country;