CREATE TABLE [Research].[RefTimeSeries] (
    [SeriesID]          VARCHAR (900)  NOT NULL,
    [SeriesName]        VARCHAR (1000) NULL,
    [SeriesDescription] VARCHAR (1000) NULL,
    [OperatorID]        VARCHAR (1000) NULL,
    [RegulatorCode]     VARCHAR (100)  NULL,
    [MeterID]           VARCHAR (100)  NULL,
    [Location]          VARCHAR (100)  NULL,
    [Direction]         VARCHAR (100)  NULL,
    [UnitOfMeasure]     VARCHAR (100)  NULL,
    CONSTRAINT [PK_RefTimeSeries] PRIMARY KEY CLUSTERED ([SeriesID] ASC)
);

