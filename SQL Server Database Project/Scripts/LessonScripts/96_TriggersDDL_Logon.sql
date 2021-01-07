SELECT * FROM sys.dm_exec_sessions; -- View
SELECT is_user_process, original_login_name FROM sys.dm_exec_sessions
ORDER BY login_time DESC;

CREATE TRIGGER trAuditLogin
ON ALL SERVER FOR LOGON
AS BEGIN
	DECLARE @LoginName Nvarchar(100);
	SET @LoginName = ORIGINAL_LOGIN();

	IF (
		SELECT COUNT(session_id) FROM sys.dm_exec_sessions
		WHERE is_user_process = 1 AND original_login_name = @LoginName
		) > 3
	BEGIN
		PRINT('Fourth connection attempt by ' + @LoginName + ' blocked.');
		ROLLBACK;	
	END;
END;

EXECUTE sp_readerrorlog;