CREATE TABLE [DW].[HubPoint] (
    [PointHashKey] CHAR (32)     NOT NULL,
    [RecordSource] VARCHAR (100) NOT NULL,
    [LoadDate]     DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [PLEID]        VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_HubPoint] PRIMARY KEY CLUSTERED ([PointHashKey] ASC, [RecordSource] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_HubPoint_PLEID]
    ON [DW].[HubPoint]([PLEID] ASC);

