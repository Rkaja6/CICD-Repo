CREATE PROCEDURE dbo.SDE_pinfo_def_insert
 @sdeIdVal INTEGER,
  @serverIdVal INTEGER,
 @directConnectVal VARCHAR(1),
 @sysnameVal NVARCHAR(32),
 @nodenameVal NVARCHAR(256),
 @xdrneededVal VARCHAR(1),
 @tablenameVal NVARCHAR(95) AS SET NOCOUNT ON
 BEGIN TRAN pinfo_tran
 DECLARE @current_user NVARCHAR(30)
 DECLARE process_cursor CURSOR LOCAL FAST_FORWARD FOR 
 SELECT sde_id FROM dbo.SDE_process_information WITH  (TABLOCK,XLOCK,HOLDLOCK) 
 WHERE spid = @@spid and table_name <> @tablenameVal 
 OPEN process_cursor 
 DECLARE @sde_id INTEGER
 FETCH NEXT FROM process_cursor INTO @sde_id
 WHILE @@FETCH_STATUS = 0
  BEGIN
  /* We found an invalid connection, clean it up. */ 
  EXECUTE dbo.SDE_pinfo_def_delete @sde_id
  FETCH NEXT FROM process_cursor INTO @sde_id
  END /* while */ 
 CLOSE process_cursor
 DEALLOCATE process_cursor
 EXECUTE dbo.SDE_get_current_user_name @current_user OUTPUT
 INSERT INTO dbo.SDE_process_information (sde_id,spid,server_id,start_time,
    rcount,wcount,opcount,numlocks,fb_partial,fb_count,fb_fcount,
    fb_kbytes,owner,direct_connect,sysname,nodename,xdr_needed,table_name)
 VALUES (@sdeIdVal,@@spid,@serverIdVal,getdate(),0,0,0,0,0,0,0,0,
    @current_user,@directConnectVal,@sysnameVal,@nodenameVal,
    @xdrneededVal,@tablenameVal)
 DELETE FROM dbo.SDE_lineages_modified 
    WHERE DATEDIFF (day, time_last_modified, getdate()) > 2
 COMMIT TRAN pinfo_tran
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_pinfo_def_insert] TO PUBLIC
    AS [dbo];

