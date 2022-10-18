CREATE TABLE [dbo].[AzureSQLMaintenanceLog] (
    [id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [OperationTime] DATETIME2 (7)  NULL,
    [command]       VARCHAR (4000) NULL,
    [ExtraInfo]     VARCHAR (4000) NULL,
    [StartTime]     DATETIME2 (7)  NULL,
    [EndTime]       DATETIME2 (7)  NULL,
    [StatusMessage] VARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

