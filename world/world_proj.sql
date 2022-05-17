USE world;

-- Using COUNT, get the number of cities in the USA.
SELECT COUNT(CountryCode) AS NumberOfUSCities FROM city WHERE CountryCode='USA';

-- See all fields in Country table
SELECT * FROM country;

-- Find out the population and life expectancy for people in Argentina.
SELECT Name, LifeExpectancy, Population FROM country WHERE Code = 'ARG';

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT Name, LifeExpectancy FROM country WHERE LifeExpectancy IS NOT NULL  ORDER BY LifeExpectancy DESC LIMIT 1;

-- Using JOIN ... ON, find the capital city of Spain.
