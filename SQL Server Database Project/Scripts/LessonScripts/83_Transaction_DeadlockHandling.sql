-- Window 1
EXECUTE spTransaction1;
-- Window 2
EXECUTE spTransaction2; -- Deadlock error.


ALTER PROCEDURE [dbo].[spTransaction1]
AS BEGIN
	BEGIN TRAN
	BEGIN TRY
		UPDATE tblPersonA SET Name = Name + ' Transaction 1' WHERE Id = 1;
		WAITFOR DELAY '00:00:15';
		UPDATE tblPersonB SET Name = Name + ' Transaction 1' WHERE Id = 1;
		COMMIT TRANSACTION;
		SELECT 'Transaction successful';
	END TRY
	BEGIN CATCH
		IF(ERROR_NUMBER() = 1205)
		BEGIN
			SELECT 'Deadlock - transaction failed';
			ROLLBACK TRANSACTION;
		END
	END CATCH;
END;
ALTER PROCEDURE [dbo].[spTransaction2]
AS BEGIN
	BEGIN TRAN
	BEGIN TRY
		UPDATE tblPersonB SET Name = Name + ' Transaction 2' WHERE Id = 1;
		WAITFOR DELAY '00:00:15';
		UPDATE tblPersonA SET Name = Name + ' Transaction 2' WHERE Id = 1;
		COMMIT TRANSACTION;
		SELECT 'Transaction successful';
	END TRY
	BEGIN CATCH
		IF(ERROR_NUMBER() = 1205)
		BEGIN
			SELECT 'Deadlock - transaction failed';
			ROLLBACK;
		END
	END CATCH;
END;
-- Window 1
EXECUTE spTransaction1;
-- Window 2
EXECUTE spTransaction2;