CREATE TABLE [DW].[SatWellInternal] (
    [WellHashKey]        BINARY (32)     NOT NULL,
    [RecordSource]       VARCHAR (50)    NOT NULL,
    [LoadDate]           DATETIME2 (7)   CONSTRAINT [DF__SatWellIn__LoadD__062DE679] DEFAULT (getdate()) NOT NULL,
    [LoadEndDate]        DATETIME2 (7)   NULL,
    [SEC_PropNum]        VARCHAR (12)    NULL,
    [Region]             VARCHAR (60)    NULL,
    [TC_Area]            VARCHAR (50)    NULL,
    [Pipeline_Area]      VARCHAR (50)    NULL,
    [TELL_Geo_Reservoir] VARCHAR (50)    NULL,
    [Bench]              VARCHAR (50)    NULL,
    [Tech_EUR_Gas]       DECIMAL (13, 9) NULL,
    [Tech_EUR_Oil]       DECIMAL (13, 9) NULL,
    [GIS_Number]         INT             NULL,
    CONSTRAINT [PK_SatWellInternal] PRIMARY KEY CLUSTERED ([WellHashKey] ASC, [LoadDate] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

