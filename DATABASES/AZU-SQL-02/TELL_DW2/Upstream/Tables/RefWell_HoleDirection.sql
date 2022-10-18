CREATE TABLE [Upstream].[RefWell_HoleDirection] (
    [Hole_Direction]     VARCHAR (12)  NOT NULL,
    [LoadDate]           DATETIME2 (7) CONSTRAINT [DF__RefWell_H__LoadD__162F4418] DEFAULT (getdate()) NULL,
    [RecordSource]       VARCHAR (50)  NULL,
    [New_Hole_Direction] VARCHAR (12)  NULL,
    CONSTRAINT [PK_RefWell_HoleDirection] PRIMARY KEY NONCLUSTERED ([Hole_Direction] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

