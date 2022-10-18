CREATE TABLE [StagePLE].[RegionalFlowPipeline] (
    [ReportedDate] VARCHAR (50)  NOT NULL,
    [FlowDate]     VARCHAR (50)  NOT NULL,
    [Region]       VARCHAR (200) NOT NULL,
    [PipeLine]     VARCHAR (200) NOT NULL,
    [Throughput]   VARCHAR (100) NOT NULL,
    [FlowType]     VARCHAR (100) NOT NULL,
    [Volume]       VARCHAR (100) NULL,
    CONSTRAINT [PK_RegionalFlowPipeline] PRIMARY KEY CLUSTERED ([ReportedDate] ASC, [FlowDate] ASC, [Region] ASC, [PipeLine] ASC, [Throughput] ASC, [FlowType] ASC)
);

