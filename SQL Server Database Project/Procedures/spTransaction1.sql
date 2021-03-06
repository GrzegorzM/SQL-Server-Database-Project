CREATE PROCEDURE [dbo].[spTransaction1]
AS BEGIN
	BEGIN TRAN
		UPDATE tblPersonA SET Name = Name + ' Transaction 1' WHERE Id = 1;
		WAITFOR DELAY '00:00:15';
		UPDATE tblPersonB SET Name = Name + ' Transaction 1' WHERE Id = 1;
	COMMIT TRANSACTION;
END;