/*
    This script was generated by SQL Change Automation to help provide object-level history. This script should never be edited manually.
    For more information see: https://www.red-gate.com/sca/dev/offline-schema-model
*/

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TLN\TTaylor')
CREATE LOGIN [TLN\TTaylor] FROM WINDOWS
GO
CREATE USER [TLN\ttaylor] FOR LOGIN [TLN\TTaylor]
GO
