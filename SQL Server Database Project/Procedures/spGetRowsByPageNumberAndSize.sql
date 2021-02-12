CREATE PROCEDURE [dbo].[spGetRowsByPageNumberAndSize]
	@PageNumber INT,
	@PageSize INT
AS
BEGIN
    SELECT * FROM tblProducts2
    ORDER BY Id
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY
END;