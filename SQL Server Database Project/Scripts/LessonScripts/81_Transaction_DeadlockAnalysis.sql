-- The deadlock information in the error log has three sections
-- 1. Deadlock Victim - Contains the ID of the process that was selected as the deadlock victim and killed by SQL Server.
-- 2. Process List - Contains the list of the processes that participated in the deadlock.
-- 3. Resource List - Contains the list of the resources (database objects) owned by the processes involved in the deadlock.

/*
deadlock-list
-- 1.
 deadlock victim=process3d1031468
 -- 2.
  process-list
   process id=process3d1031468 taskpriority=0 logused=332 waitresource=KEY: 8:72057594045726720 (8194443284a0) waittime=3937 ownerId=86226 transactionname=user_transaction lasttranstarted=2021-03-04T23:42:58.560 XDES=0x3c37003b0 lockMode=X schedulerid=4 kpid=6312 status=suspended spid=56 sbid=0 ecid=0 priority=0 trancount=2 lastbatchstarted=2021-03-04T23:42:58.560 lastbatchcompleted=2021-03-04T23:42:58.560 lastattention=1900-01-01T00:00:00.560 clientapp=Microsoft SQL Server Management Studio - Query hostname=DESKTOP-A32UFAF hostpid=14932 loginname=DESKTOP-A32UFAF\Kesiu isolationlevel=read committed (2) xactid=86226 currentdb=8 lockTimeout=4294967295 clientoption1=671090784 clientoption2=390200
    executionStack
     frame procname=Sample.dbo.spTransaction1 line=6 stmtstart=314 stmtend=442 sqlhandle=0x030008003df0796be3438601e0ac000001000000000000000000000000000000000000000000000000000000
UPDATE tblPersonB SET Name = Name + ' Transaction 1' WHERE Id =     
     frame procname=adhoc line=1 sqlhandle=0x0100080025021504c0b64abf0300000000000000000000000000000000000000000000000000000000000000
EXECUTE spTransaction1;     
    inputbuf
EXECUTE spTransaction1;    
   process id=process3d1061088 taskpriority=0 logused=356 waitresource=KEY: 8:72057594045661184 (8194443284a0) waittime=1802 ownerId=86229 transactionname=user_transaction lasttranstarted=2021-03-04T23:43:00.707 XDES=0x3cc51e890 lockMode=X schedulerid=10 kpid=6380 status=suspended spid=60 sbid=0 ecid=0 priority=0 trancount=2 lastbatchstarted=2021-03-04T23:43:00.707 lastbatchcompleted=2021-03-04T23:43:00.707 lastattention=1900-01-01T00:00:00.707 clientapp=Microsoft SQL Server Management Studio - Query hostname=DESKTOP-A32UFAF hostpid=14932 loginname=DESKTOP-A32UFAF\Kesiu isolationlevel=read committed (2) xactid=86229 currentdb=8 lockTimeout=4294967295 clientoption1=671090784 clientoption2=390200
    executionStack
     frame procname=Sample.dbo.spTransaction2 line=6 stmtstart=314 stmtend=442 sqlhandle=0x0300080076146e6c00c08601e0ac000001000000000000000000000000000000000000000000000000000000
UPDATE tblPersonA SET Name = Name + ' Transaction 2' WHERE Id =     
     frame procname=adhoc line=1 sqlhandle=0x01000800cab2ce16b0feb3c30300000000000000000000000000000000000000000000000000000000000000
EXECUTE spTransaction2;     
    inputbuf
EXECUTE spTransaction2;    
-- 3.
  resource-list
   keylock hobtid=72057594045726720 dbid=8 objectname=Sample.dbo.tblPersonB indexname=PK__tblPerso__3214EC07634EDF14 id=lock3c2549e00 mode=X associatedObjectId=72057594045726720
    owner-list
     owner id=process3d1061088 mode=X
    waiter-list
     waiter id=process3d1031468 mode=X requestType=wait
   keylock hobtid=72057594045661184 dbid=8 objectname=Sample.dbo.tblPersonA indexname=PK__tblPerso__3214EC071D40D3C3 id=lock3c2549f00 mode=X associatedObjectId=72057594045661184
    owner-list
     owner id=process3d1031468 mode=X
    waiter-list
     waiter id=process3d1061088 mode=X requestType=wait  
*/

-- To prevent the above deadlock, change the order of the updated tables based on your analysis.