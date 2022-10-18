CREATE TABLE [Research].[RefPoints] (
    [RecordSource] VARCHAR (50)  NOT NULL,
    [LoadDate]     DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [PLEID]        VARCHAR (50)  NOT NULL,
    [DRN]          VARCHAR (50)  NULL,
    [PointName]    VARCHAR (500) NULL,
    [PointType]    VARCHAR (200) NULL,
    [State]        VARCHAR (100) NULL,
    [County]       VARCHAR (200) NULL,
    [Region]       VARCHAR (200) NULL,
    CONSTRAINT [PK_RefPoints] PRIMARY KEY CLUSTERED ([RecordSource] ASC, [LoadDate] ASC, [PLEID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_RefPoints_State_County]
    ON [Research].[RefPoints]([State] ASC, [County] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_RefPoints_PointName_PointType]
    ON [Research].[RefPoints]([PointName] ASC, [PointType] ASC);

