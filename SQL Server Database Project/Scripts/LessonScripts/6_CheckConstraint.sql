-- Select the table name in ManagementStudio and press Alt+F1 to display table information such as column data types etc.
Alter Table tblPerson
Add Age int;

Insert into tblPerson values(4, 'Sara', 'Sara@mail.com', 2, -69);
Select * from tblPerson;
Update tblPerson set Age = 69 where Age < 1;

Alter Table tblPerson
Add Constraint CK_tblPerson_Age Check (Age > 0 AND Age < 150); -- Add Constraint
Alter Table tblPerson
NoCheck Constraint CK_tblPerson_Age; -- Disable Constraint
ALTER TABLE tblPerson NOCHECK CONSTRAINT ALL; -- Disable All Constraint of the specified table(Check, Default etc.)

Insert into tblPerson values(4, 'Sara', 'Sara@mail.com', 2, -69); -- The check constraint does not allow adding a record.
Insert into tblPerson values(4, 'Sara', 'Sara@mail.com', 2, NULL); -- The check constraint allows to add a record.

Alter Table tblPerson
Drop Constraint CK_tblPerson_Age; -- Removing Constraint