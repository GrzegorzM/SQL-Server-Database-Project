CREATE TABLE tblPerson (
    ID int Primary Key Identity(1, 1),
    LastName varchar(255) NOT NULL Unique,
    [First Name] varchar(255) NOT NULL,
    Age int Check(Age > 0) Default(69),
    City varchar(255),
    GenderId int Foreign Key References tblGender(Id),
    Check([First Name] != LastName),
    CONSTRAINT CK_tblPerson_Age_City CHECK (Age>=18 AND City='London')
); 

Create Table tblGender(
	Id int NOT NULL Primary Key,
	Gender nvarchar(50) NOT NULL
);

--~~ Shotcuts ~~--

-- 1. Execution Plan
-- Ctrl + L

-- 2.