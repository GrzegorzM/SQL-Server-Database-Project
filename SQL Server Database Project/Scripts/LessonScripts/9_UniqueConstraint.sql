Alter Table tblPerson
Add Constraint UQ_tblPerson_Email Unique (Email);

insert into tblPerson values(10, 'Catrina', 'default@email.com', 1 , 20);
insert into tblPerson values(11, 'Anna', 'default@email.com', 1 , 20);

Alter Table tblPerson
Drop Constraint UQ_tblPerson_Email;