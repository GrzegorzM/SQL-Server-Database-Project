-- 1. Open SQL Profiler.
-- 2. Click File - New Trace. Provide the credentials and connect to the server.
-- 3. On the general tab, select "Blank" template from "Use the template" dropdownlist.
-- 4. On the "Events Selection" tab, expand "Locks" section and select "Deadlock graph" event.
-- 5. Finally click the Run button to start the trace.
-- 6. At this point execute the code that causes deadlock.
-- 7. The deadlock graph should be captured in the profiler.

-- Saving to a file as XML.
-- 1. In SQL profiler, click on "File - Export - Extract SQL Server Events - Extract Deadlock Events".
-- 2. Provide a name for the file.
-- 3. The extension for the deadlock xml file is .xdl.
-- 4. Finally choose if you want to export all events in a single file or each event in a separate file.

	SELECT OBJECT_NAME([OBJECT_ID]) FROM SYS.PARTITIONS WHERE HOBT_ID = 72057594045661184;
	SELECT * FROM SYS.PARTITIONS WHERE HOBT_ID = 72057594045661184;

	-- Triggering a deadlock for analysis. 
	BEGIN TRAN -- Transaction 1
		UPDATE tblPersonA SET Name = Name WHERE Id = 1;
		WAITFOR DELAY '00:00:15';
		UPDATE tblPersonB SET Name = Name WHERE Id = 1;
	COMMIT TRANSACTION;
	BEGIN TRAN -- Transaction 2
		UPDATE tblPersonB SET Name = Name WHERE Id = 1;
		WAITFOR DELAY '00:00:15';
		UPDATE tblPersonA SET Name = Name WHERE Id = 1;
	COMMIT TRANSACTION;