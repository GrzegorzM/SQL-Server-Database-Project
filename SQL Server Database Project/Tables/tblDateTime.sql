CREATE TABLE [dbo].[tblDateTime]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ColumnTime] TIME NULL, 
    [ColumnDate] DATE NULL, 
    [ColumnSmallDatetime] SMALLDATETIME NULL, 
    [ColumnDatetime] DATETIME NULL, 
    [ColumnDatetime2] DATETIME2 NULL, 
    [ColumnDatetimeOffset] DATETIMEOFFSET NULL
)
