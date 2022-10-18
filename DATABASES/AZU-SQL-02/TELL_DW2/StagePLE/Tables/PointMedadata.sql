CREATE TABLE [StagePLE].[PointMedadata] (
    [PLEID]          VARCHAR (300) NOT NULL,
    [DRN]            VARCHAR (300) NOT NULL,
    [PointName]      VARCHAR (300) NOT NULL,
    [PointType]      VARCHAR (300) NULL,
    [State]          VARCHAR (300) NULL,
    [County]         VARCHAR (300) NULL,
    [Region]         VARCHAR (300) NULL,
    [Pipeline]       VARCHAR (300) NULL,
    [PointIsActive]  VARCHAR (300) NULL,
    [DesignCapacity] VARCHAR (300) NULL,
    [FlowDirection]  VARCHAR (300) NULL,
    CONSTRAINT [PK_PointMedadata] PRIMARY KEY CLUSTERED ([PLEID] ASC)
);

