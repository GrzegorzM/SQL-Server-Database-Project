SELECT * FROM tblProducts2;

-- Syntax 
SELECT * FROM tblProducts2
ORDER BY Column_List
OFFSET Rows_To_Skip ROWS
FETCH NEXT Rows_To_Fetch ROWS ONLY;

SELECT * FROM tblProducts2
ORDER BY Id
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

CREATE PROCEDURE spGetRowsByPageNumberAndSize
	@PageNumber INT,
	@PageSize INT
AS
BEGIN
    SELECT * FROM tblProducts2
    ORDER BY Id
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY
END;

EXEC spGetRowsByPageNumberAndSize 10, 20;

-- Script for creating a table and populate it with data.
CREATE TABLE tblProducts3
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(25),
    [Description] NVARCHAR(50),
    Price INT
)
GO
DECLARE @Start INT;
SET @Start = 1;

DECLARE @Name VARCHAR(25);
DECLARE @Description VARCHAR(50);

WHILE(@Start <= 100)
BEGIN
    SET @Name = 'PRODUCT - ' + LTRIM(@Start)
    SET @Description = 'PRODUCT DESCRIPTION - ' + LTRIM(@Start)
    INSERT INTO tblProducts3 VALUES (@Name, @Description, @Start * 10)
    SET @Start = @Start + 1
END;