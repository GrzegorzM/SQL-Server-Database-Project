Insert into tblPerson(Id, Name, Email)
Values (7, 'Rich', 'Rich@mail.com');

Alter Table tblPerson Add Constraint DF_tblPerson_GenderId
Default 3 For GenderId;

Insert into tblPerson(Id, Name, Email)
Values (8, 'Mike', 'Mike@mail.com'); -- Default constraint executed

Insert into tblPerson(Id, Name, Email, GenderId)
Values (9, 'Sara', 'Sara@mail.com', 2);

Insert into tblPerson(Id, Name, Email, GenderId)
Values (10, 'John', 'John@mail.com', NULL); -- Default constraint not executed

Alter table tblPerson Drop Constraint DF_tblPerson_GenderId;