SELECT * FROM tblCountrySales;

-- ROLLUP(Continent, Country, City) produces Sum of Salary for the following hierarchy
-- Continent, Country, City
-- Continent, Country, 
-- Continent
-- ();

-- CUBE(Continent, Country, City) produces Sum of Salary for all the following column combinations
-- Continent, Country, City
-- Continent, Country, 
-- Continent, City
-- Continent
-- Country, City
-- Country,
-- City
-- ();

-- Rollup
SELECT Continent, Country, City, SUM(SaleAmount) AS TotalSales FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

-- Cube
SELECT Continent, Country, City, SUM(SaleAmount) AS TotalSales FROM tblCountrySales
GROUP BY CUBE(Continent, Country, City);

-- No difference when using ROLLUP and CUBE on a single column. Both the following queries produces the same output.
SELECT Continent, Sum(SaleAmount) AS TotalSales FROM tblCountrySales
GROUP BY ROLLUP(Continent);
-- OR
SELECT Continent, SUM(SaleAmount) AS TotalSales FROM tblCountrySales
GROUP BY CUBE(Continent);