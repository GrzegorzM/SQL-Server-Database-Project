select * from tblGender;
select * from tblPerson;

-- Data referenced by the foreign key cannot be deleted (Delete rule default value = No Action)
Delete from tblGender where Id = 2;

Alter Table tblPerson
Drop Constraint tblPerson_GenderId_FK;

-- Set Default
ALTER TABLE tblPerson ADD CONSTRAINT FK_tblPerson_GenderId
Foreign Key(GenderID) REFERENCES tblGender(ID) ON DELETE SET DEFAULT
	Alter Table tblPerson Drop Constraint FK_tblPerson_GenderId;

-- Set Null
ALTER TABLE tblPerson ADD CONSTRAINT FK_tblPerson_GenderId
Foreign Key(GenderID) REFERENCES tblGender(ID) ON DELETE SET NULL
	Alter Table tblPerson Drop Constraint FK_tblPerson_GenderId;

-- Cascade (Removes records matching the deleted one)
ALTER TABLE tblPerson ADD CONSTRAINT FK_tblPerson_GenderId
Foreign Key(GenderID) REFERENCES tblGender(ID) ON DELETE CASCADE
	Alter Table tblPerson Drop Constraint FK_tblPerson_GenderId;

-- NoAction
ALTER TABLE tblPerson ADD CONSTRAINT FK_tblPerson_GenderId
Foreign Key(GenderID) REFERENCES tblGender(ID)