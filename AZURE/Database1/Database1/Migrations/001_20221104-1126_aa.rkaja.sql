-- <Migration ID="223a242d-2faf-4073-92e4-d424a9b8db70" />
GO

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TLN\jlogbotche')
CREATE LOGIN [TLN\jlogbotche] FROM WINDOWS
GO
CREATE USER [TLN\jlogbotche] FOR LOGIN [TLN\jlogbotche]
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TLN\svc-powerbi')
CREATE LOGIN [TLN\svc-powerbi] FROM WINDOWS
GO
CREATE USER [TLN\svc-powerbi] FOR LOGIN [TLN\svc-powerbi]
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TLN\TTaylor')
CREATE LOGIN [TLN\TTaylor] FROM WINDOWS
GO
CREATE USER [TLN\ttaylor] FOR LOGIN [TLN\TTaylor]
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TLN\Upstream')
CREATE LOGIN [TLN\Upstream] FROM WINDOWS
GO
CREATE USER [TLN\upstream] FOR LOGIN [TLN\Upstream]
GO
PRINT N'Altering members of role db_datareader'
GO
ALTER ROLE [db_datareader] ADD MEMBER [TLN\jlogbotche]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TLN\svc-powerbi]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TLN\ttaylor]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TLN\upstream]
GO
PRINT N'Creating [dbo].[ZediData]'
GO
CREATE TABLE [dbo].[ZediData]
(
[location_id] [int] NULL,
[location] [nvarchar] (100) NULL,
[readingtime] [datetime] NOT NULL,
[sensor] [nvarchar] (100) NULL,
[sensor_id] [int] NOT NULL,
[unit] [nvarchar] (25) NULL,
[amount] [float] NULL,
[amountstring] [nvarchar] (max) NULL,
[amountdatetimeutc] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK__ZediData__7898FF2825A0D962] on [dbo].[ZediData]'
GO
ALTER TABLE [dbo].[ZediData] ADD CONSTRAINT [PK__ZediData__7898FF2825A0D962] PRIMARY KEY CLUSTERED ([readingtime], [sensor_id])
GO
PRINT N'Creating index [ndx_location_sensor_incl_all] on [dbo].[ZediData]'
GO
CREATE NONCLUSTERED INDEX [ndx_location_sensor_incl_all] ON [dbo].[ZediData] ([location_id], [sensor]) INCLUDE ([location], [readingtime], [sensor_id], [unit], [amount], [amountstring], [amountdatetimeutc])
GO
PRINT N'Creating [dbo].[ZediDataQTR]'
GO
CREATE TABLE [dbo].[ZediDataQTR]
(
[location_id] [int] NULL,
[location] [nvarchar] (100) NULL,
[starttime] [datetime] NOT NULL,
[endtime] [datetime] NULL,
[sensor] [nvarchar] (100) NULL,
[sensor_id] [int] NOT NULL,
[unit] [nvarchar] (25) NULL,
[amount] [float] NULL,
[qtrtype] [nvarchar] (15) NULL
)
GO
PRINT N'Creating primary key [PK__ZediData__345A12023E25804F] on [dbo].[ZediDataQTR]'
GO
ALTER TABLE [dbo].[ZediDataQTR] ADD CONSTRAINT [PK__ZediData__345A12023E25804F] PRIMARY KEY CLUSTERED ([starttime], [sensor_id])
GO
PRINT N'Creating index [ndx_location_sensor_incl_all_QTR] on [dbo].[ZediDataQTR]'
GO
CREATE NONCLUSTERED INDEX [ndx_location_sensor_incl_all_QTR] ON [dbo].[ZediDataQTR] ([location_id], [sensor]) INCLUDE ([location], [starttime], [endtime], [sensor_id], [unit], [amount], [qtrtype])
GO
PRINT N'Creating [dbo].[StatusLookup]'
GO
CREATE TABLE [dbo].[StatusLookup]
(
[StatusKey] [int] NOT NULL,
[StatusFirstName] [varchar] (255) NULL,
[StatusLastName] [varchar] (255) NULL
)
GO
PRINT N'Creating primary key [StatusLookUpPK] on [dbo].[StatusLookup]'
GO
ALTER TABLE [dbo].[StatusLookup] ADD CONSTRAINT [StatusLookUpPK] PRIMARY KEY CLUSTERED ([StatusKey])
GO
