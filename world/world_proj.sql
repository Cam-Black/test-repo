USE world;

SELECT COUNT(CountryCode) AS NumberOfUSCities FROM city WHERE CountryCode='USA';

SELECT * FROM country;

SELECT Name, LifeExpectancy, Population FROM country WHERE Code = 'ARG';

