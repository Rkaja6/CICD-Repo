CREATE TABLE [Research].[TimeSeries] (
    [SeriesID]      VARCHAR (100)    NOT NULL,
    [UnitOfMeasure] VARCHAR (100)    NOT NULL,
    [StartDate]     DATETIME2 (7)    NOT NULL,
    [EndDate]       DATETIME2 (7)    NULL,
    [Value]         NUMERIC (38, 16) NULL,
    CONSTRAINT [PK_TimeSeries] PRIMARY KEY CLUSTERED ([SeriesID] ASC, [UnitOfMeasure] ASC, [StartDate] ASC)
);

