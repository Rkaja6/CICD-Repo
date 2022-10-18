CREATE TABLE [StagePLE].[FlowByPoints] (
    [ReportedDate]        VARCHAR (200) NOT NULL,
    [FlowDate]            VARCHAR (200) NOT NULL,
    [PLEID]               VARCHAR (200) NOT NULL,
    [Volume]              VARCHAR (50)  NULL,
    [OperationalCapacity] VARCHAR (50)  NULL,
    CONSTRAINT [PK_FlowByPoints] PRIMARY KEY CLUSTERED ([ReportedDate] ASC, [FlowDate] ASC, [PLEID] ASC)
);

