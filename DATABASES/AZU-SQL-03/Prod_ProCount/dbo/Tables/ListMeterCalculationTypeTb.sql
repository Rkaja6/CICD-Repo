CREATE TABLE [dbo].[ListMeterCalculationTypeTb] (
    [Value]       INT           NOT NULL,
    [Description] VARCHAR (100) NULL,
    [ActiveFlag]  INT           NULL,
    CONSTRAINT [PK_ListMeterCalculationTypeTb] PRIMARY KEY CLUSTERED ([Value] ASC)
);

