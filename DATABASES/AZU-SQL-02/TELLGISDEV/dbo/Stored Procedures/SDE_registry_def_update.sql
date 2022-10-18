﻿CREATE PROCEDURE dbo.SDE_registry_def_update        @rowidColVal NVARCHAR(32), @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @conKeyWordVal  NVARCHAR(32), @minIdVal INTEGER, @regIdVal INTEGER,       @imvNameVal NVARCHAR (128) AS SET NOCOUNT ON       UPDATE dbo.SDE_table_registry SET rowid_column = @rowidColVal, description = @descVal,       object_flags = @objFlagsVal ,config_keyword = @conKeyWordVal,       minimum_id = @minIdVal, imv_view_name = @imvNameVal       WHERE registration_id = @regIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_registry_def_update] TO PUBLIC
    AS [dbo];

