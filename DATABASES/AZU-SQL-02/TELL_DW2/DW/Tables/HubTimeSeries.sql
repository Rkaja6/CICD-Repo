CREATE TABLE [DW].[HubTimeSeries] (
    [RecordSource]      VARCHAR (50)  NOT NULL,
    [LoadDate]          DATETIME2 (7) NOT NULL,
    [SeriesID]          VARCHAR (100) NULL,
    [OperatorID]        VARCHAR (100) NULL,
    [RegulatorCode]     VARCHAR (100) NULL,
    [MeterID]           VARCHAR (100) NULL,
    [Location]          VARCHAR (100) NULL,
    [Direction]         VARCHAR (100) NULL,
    [UnitOfMeasure]     VARCHAR (100) NULL,
    [TimeSeriesHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_HubTimeSeries] PRIMARY KEY NONCLUSTERED ([TimeSeriesHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);


GO
CREATE NONCLUSTERED INDEX [idx_hubtimeseries_seriesid_operatorid_regulatorcode_meterid_location_direction_unitofmeasure]
    ON [DW].[HubTimeSeries]([SeriesID] ASC, [OperatorID] ASC, [RegulatorCode] ASC, [MeterID] ASC, [Location] ASC, [Direction] ASC, [UnitOfMeasure] ASC);

