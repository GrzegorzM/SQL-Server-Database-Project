-- Syntax : GROUPING function is used on single column, where as the column list for GROUPING_ID function must match with GROUP BY column list.
GROUPING(Col1);
GROUPING_ID(Col1, Col2, Col3,...);

SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	GROUPING(Continent) as Grouping_Continent,
	GROUPING(Country) as Grouping_Country,
	GROUPING(City) as Grouping_City
	FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	GROUPING(Continent) +
	GROUPING(Country) +
	GROUPING(City) as Groupings
	FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	CAST(GROUPING(Continent) AS NVARCHAR(1)) +
	CAST(GROUPING(Country) AS NVARCHAR(1)) +
	CAST(GROUPING(City) AS NVARCHAR(1)) AS Groupings
	FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	CAST(GROUPING(Continent) AS NVARCHAR(1)) +
	CAST(GROUPING(Country) AS NVARCHAR(1)) +
	CAST(GROUPING(City) AS NVARCHAR(1)) AS Groupings,
	GROUPING_ID(Continent, Country, City)
	FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

-- Inconsistance result, Continent not present in the calculations. The continent is not involved in the GROUPING_ID calculation.
SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	CAST(GROUPING(Continent) AS NVARCHAR(1)) +
	CAST(GROUPING(Country) AS NVARCHAR(1)) +
	CAST(GROUPING(City) AS NVARCHAR(1)) AS Groupings,
	GROUPING_ID(Country, City)
	FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City);

-- Sort by Grouping_Id.
SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	GROUPING_ID(Continent, Country, City) AS GroupingId
	FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City)
ORDER BY GroupingId;

-- Filter by Grouping_Id.
SELECT Continent, Country, City, SUM(SaleAmount) as TotalSales,
	GROUPING_ID(Continent, Country, City) AS GroupingId
	FROM tblCountrySales
GROUP BY ROLLUP(Continent, Country, City)
HAVING GROUPING_ID(Continent, Country, City) = 1;