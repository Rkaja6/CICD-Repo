CREATE TABLE [StagePLE].[AggregateFlow] (
    [Date]         VARCHAR (50)  NOT NULL,
    [Pipeline]     VARCHAR (200) NOT NULL,
    [LocationType] VARCHAR (100) NOT NULL,
    [Region]       VARCHAR (200) NOT NULL,
    [State]        VARCHAR (100) NOT NULL,
    [Sample]       VARCHAR (50)  NULL,
    CONSTRAINT [PK_AggregateFlow] PRIMARY KEY CLUSTERED ([Date] ASC, [Pipeline] ASC, [LocationType] ASC, [Region] ASC, [State] ASC)
);

