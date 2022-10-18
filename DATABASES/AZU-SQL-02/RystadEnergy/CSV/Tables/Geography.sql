CREATE TABLE [CSV].[Geography] (
    [Id]                    SMALLINT      NULL,
    [Country]               VARCHAR (26)  NULL,
    [State]                 VARCHAR (32)  NULL,
    [County]                VARCHAR (82)  NULL,
    [Basin]                 VARCHAR (84)  NULL,
    [Data Source]           VARCHAR (176) NULL,
    [EIA DPR Region]        VARCHAR (36)  NULL,
    [EIA PAD District]      VARCHAR (12)  NULL,
    [EIA Refining District] VARCHAR (84)  NULL,
    [Sub Basin]             VARCHAR (84)  NULL,
    [TellurianUpdatedDate]  DATETIME      DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]  DATETIME      DEFAULT (getdate()) NULL
);

