/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

insert into tblProduct values('Laptop', 2200, 100);
insert into tblProduct values('Desktop', 1200, 246);

insert into tblMailingAddress values (1, 120, 'Sesame Street', 'Manchester', '12-323');
insert into tblPhysicalAddress values (1, 120, 'Sesame Street', 'Manchester', '12-323');

insert into tblProducts1 values ('TV', '40 inch LCD TV');
insert into tblProducts1 values ('Laptop', '20 inch Acer');
insert into tblProducts1 values ('Desktop', 'HP High Performance');

insert into tblProductSales1 values (3, 400, 5);
insert into tblProductSales1 values (2, 200, 7);
insert into tblProductSales1 values (3, 350, 2);
insert into tblProductSales1 values (3, 450, 4);