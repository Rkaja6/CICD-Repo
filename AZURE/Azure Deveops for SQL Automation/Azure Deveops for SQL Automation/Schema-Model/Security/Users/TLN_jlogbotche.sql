﻿/*
    This script was generated by SQL Change Automation to help provide object-level history. This script should never be edited manually.
    For more information see: https://www.red-gate.com/sca/dev/offline-schema-model
*/

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TLN\jlogbotche')
CREATE LOGIN [TLN\jlogbotche] FROM WINDOWS
GO
CREATE USER [TLN\jlogbotche] FOR LOGIN [TLN\jlogbotche]
GO
