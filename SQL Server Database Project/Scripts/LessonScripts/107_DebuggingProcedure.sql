CREATE PROCEDURE spPrintEvenNumbers
	@Target INT
AS BEGIN
	DECLARE @StartNumber INT;
	SET @StartNumber = 1; -- SET @StartNumber = 0;

	WHILE(@StartNumber < @Target) -- WHILE(@StartNumber <= @Target)
	BEGIN
		IF(@StartNumber % 2 = 0)
		BEGIN
			PRINT @StartNumber;
		END;
		SET @StartNumber = @StartNumber + 1;
	END;

	Print 'Finished printing even numbers till ' + RTRIM(@Target);
END;

EXEC spPrintEvenNumbers 100;

DECLARE @TargetNumber INT;
SET @TargetNumber = 10;
EXECUTE spPrintEvenNumbers @TargetNumber;
PRINT 'Executed successfully';

-- Debugger is deprecated in SSMS18!!!!!!!!
-- Alternative, using Visual Studio with SQL Server Data Tools (SSDT) installed.
-- 1. Connect to a SQL server (in Tools menu).
-- 2. Open a new query (Server explorer, right click, new query).
-- 3. Type in your query.
-- 4. Execute with Debugger.