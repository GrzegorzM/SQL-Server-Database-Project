DBCC TRACEON(1222); -- Session level.
DBCC TRACESTATUS(1222);
DBCC TRACEOFF(1222);

DBCC TRACEON(1222, -1); -- Global level.
DBCC TRACESTATUS(1222);
DBCC TRACEOFF(1222);

CREATE PROCEDURE spTransaction1
AS BEGIN
	BEGIN TRAN
		UPDATE tblPersonA SET Name = Name + ' Transaction 1' WHERE Id = 1;
		WAITFOR DELAY '00:00:15';
		UPDATE tblPersonB SET Name = Name + ' Transaction 1' WHERE Id = 1;
	COMMIT TRANSACTION;
END;

CREATE PROCEDURE spTransaction2
AS BEGIN
	BEGIN TRAN
		UPDATE tblPersonB SET Name = Name + ' Transaction 2' WHERE Id = 1;
		WAITFOR DELAY '00:00:15';
		UPDATE tblPersonA SET Name = Name + ' Transaction 2' WHERE Id = 1;
	COMMIT TRANSACTION;
END;

-- Window 1
EXECUTE spTransaction1;
-- Window 2
EXECUTE spTransaction2;

SELECT * FROM tblPersonA;
SELECT * FROM tblPersonB;

EXECUTE SP_READERRORLOG;