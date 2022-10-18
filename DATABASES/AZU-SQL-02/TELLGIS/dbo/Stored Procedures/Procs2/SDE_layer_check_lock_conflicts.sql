CREATE PROCEDURE dbo.SDE_layer_check_lock_conflicts
@sdeIdVal INTEGER,
@layerIdVal INTEGER,
@autoLockVal VARCHAR(1),
@lockTypeVal VARCHAR(1),
@minxVal BIGINT,
@minyVal BIGINT,
@maxxVal BIGINT,
@maxyVal BIGINT,
@lock_conflict INTEGER OUTPUT AS SET NOCOUNT ON
BEGIN
  DECLARE locks_cursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT sde_id
    FROM   dbo.SDE_layer_locks WITH (TABLOCKX,HOLDLOCK)
    WHERE  layer_id = @layerIdVal AND
           (sde_id <> @sdeIdVal OR
           autolock = @autoLockVal) AND
           (lock_type = 'E' /* E: Exclusive lock */ OR
            @lockTypeVal = 'E') AND
           ((maxx >= @minxVal AND maxy >= @minyVal AND
             @maxxVal >= minx AND @maxyVal >= miny) OR
             (minx IS NULL OR @minxVal IS NULL))
  /* Find any conflicting locks.  The query we use is sensitive about
     whether we are trying to place an exclusive lock (in which case we
     have to consider all locks as possibly conflicting), or a shared lock
     (in which case we only have to worry about conflicting with exclusive
     locks).  In either case, the query will include a range expression so
     composed that a lock with NULL envelope variables will always match
     any other lock.  This is because a NULL envelope indicates a layer-
     wide lock.  With all of the about constraints in place, if any rows
     are returned, we probably have a conflict.  The last thing we have to
     check is if the connection owning the lock has somehow died without
     cleaning up. */
  OPEN locks_cursor
  DECLARE @id INTEGER
  DECLARE @loop_done INTEGER
  SET @lock_conflict = 0
  SET @loop_done = 0
  DECLARE @f_sde_id INTEGER
  DECLARE @sql NVARCHAR(512)
  WHILE @loop_done = 0
  BEGIN 
    FETCH NEXT FROM locks_cursor INTO @f_sde_id
    IF @@FETCH_STATUS = 0
    BEGIN
      /* We found a matching layer lock.  See if the owning connection
         id is still out there.  If not, then this lock is invalid. */

      SET @sql = N'DECLARE @idval INTEGER SELECT @idval = SO.object_id FROM tempdb.sys.objects SO INNER JOIN 
dbo.SDE_process_information PR ON object_id (PR.table_name) = SO.object_id 
        WHERE PR.sde_id = ' + CAST(@f_sde_id AS VARCHAR(10)) 

     EXECUTE(@sql)
      IF @@ROWCOUNT > 0
      BEGIN
          /* we have a lock conflict! */
          SET @lock_conflict = 1
          SET @loop_done = 1
      END
      ELSE
      BEGIN
          /* defunct connection found, clean it up */
         EXECUTE dbo.SDE_pinfo_def_delete @f_sde_id
       END
     END
     ELSE
       SET @loop_done = 1
  END /* while */
  CLOSE locks_cursor
  DEALLOCATE locks_cursor
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_layer_check_lock_conflicts] TO PUBLIC
    AS [dbo];

