﻿CREATE PROCEDURE dbo.SDE_mvmodified_table_insert       @registration_idVal INTEGER, @state_idVal BIGINT AS      SET NOCOUNT ON      BEGIN      BEGIN TRAN mvmodified_insert      INSERT INTO dbo.SDE_mvtables_modified (registration_id, state_id)       VALUES ( @registration_idVal, @state_idVal )      COMMIT TRAN mvmodified_insert      END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_mvmodified_table_insert] TO PUBLIC
    AS [dbo];

