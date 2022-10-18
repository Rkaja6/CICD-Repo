CREATE TABLE [ETL].[Pipeline_Points_GIS] (
    [Pipeline_Points_GIS_ID] INT          IDENTITY (1, 1) NOT NULL,
    [TSP]                    VARCHAR (50) NULL,
    [Location]               VARCHAR (50) NULL,
    [RexTagID]               VARCHAR (50) NULL,
    CONSTRAINT [PK_Pipeline_Points_GIS] PRIMARY KEY CLUSTERED ([Pipeline_Points_GIS_ID] ASC)
);

