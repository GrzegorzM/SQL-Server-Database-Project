SELECT * FROM tblCountrySales;

SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales FROM tblCountrySales
GROUP BY Continent, Country, City;

-- Does not work without a rollup, cube or grouping sets.
SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	GROUPING(Continent) as Grouping_Continent,
	GROUPING(Country) as Grouping_Country,
	GROUPING(City) as Grouping_City
	FROM tblCountrySales
GROUP BY Continent, Country, City;

SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

-- Grouping returns 1 for aggregated or 0 for not aggregated in the result set. 
SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	GROUPING(Continent) as Grouping_Continent,
	GROUPING(Country) as Grouping_Country,
	GROUPING(City) as Grouping_City
	FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

-- Use of Grouping function in real world.
SELECT 
	CASE WHEN GROUPING(Continent) = 1 THEN 'ALL' ELSE ISNULL(Continent, 'Unknown') END AS Continent,
	CASE WHEN GROUPING(Country) = 1 THEN 'ALL' ELSE ISNULL(Country, 'Unknown') END AS Country,
	CASE WHEN GROUPING(City) = 1 THEN 'ALL' ELSE ISNULL(City, 'Unknown') END AS City,
	SUM(SaleAmount) as TotalSales FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

Update tblCountrySales Set City = NULL where Id = 1
SELECT -- It will not work as expected if the table contains null data. Replacing 'null' to 'all' which is misleading.
	ISNULL(Continent, 'ALL') AS Continent,
	ISNULL(Country, 'ALL') AS Country,
	ISNULL(City, 'ALL') AS City,
	SUM(SaleAmount) as TotalSales FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

-- Cube example
SELECT 
	CASE WHEN GROUPING(Continent) = 1 THEN 'ALL' ELSE ISNULL(Continent, 'Unknown') END AS Continent,
	CASE WHEN GROUPING(Country) = 1 THEN 'ALL' ELSE ISNULL(Country, 'Unknown') END AS Country,
	CASE WHEN GROUPING(City) = 1 THEN 'ALL' ELSE ISNULL(City, 'Unknown') END AS City,
	SUM(SaleAmount) as TotalSales FROM tblCountrySales
GROUP BY CUBE(Continent, Country, City);

-- Grouping Sets example
SELECT 
	CASE WHEN GROUPING(Continent) = 1 THEN 'ALL' ELSE ISNULL(Continent, 'Unknown') END AS Continent,
	CASE WHEN GROUPING(Country) = 1 THEN 'ALL' ELSE ISNULL(Country, 'Unknown') END AS Country,
	CASE WHEN GROUPING(City) = 1 THEN 'ALL' ELSE ISNULL(City, 'Unknown') END AS City,
	SUM(SaleAmount) as TotalSales FROM tblCountrySales
GROUP BY GROUPING SETS
(	
	(Continent, Country, City),
	(Continent, Country),
	(Continent),
	()
);