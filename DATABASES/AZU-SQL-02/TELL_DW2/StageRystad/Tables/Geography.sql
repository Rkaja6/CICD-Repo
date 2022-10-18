CREATE TABLE [StageRystad].[Geography] (
    [Id]                    BIGINT         NOT NULL,
    [Country]               NVARCHAR (MAX) NULL,
    [State]                 NVARCHAR (MAX) NULL,
    [County]                NVARCHAR (MAX) NULL,
    [Basin]                 NVARCHAR (MAX) NULL,
    [Data_Source]           NVARCHAR (MAX) NULL,
    [EIA_DPR_Region]        NVARCHAR (MAX) NULL,
    [EIA_PAD_District]      NVARCHAR (MAX) NULL,
    [EIA_Refining_District] NVARCHAR (MAX) NULL,
    [Sub_Basin]             NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate]  DATETIME       NULL,
    [TellurianCreatedDate]  DATETIME       NULL,
    CONSTRAINT [PK_Geography] PRIMARY KEY CLUSTERED ([Id] ASC)
);

