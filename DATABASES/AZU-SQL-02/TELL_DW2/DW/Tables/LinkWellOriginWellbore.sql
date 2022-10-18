CREATE TABLE [DW].[LinkWellOriginWellbore] (
    [WellOriginHashKey]         CHAR (32)     NOT NULL,
    [WellboreHashKey]           CHAR (32)     NOT NULL,
    [RecordSource]              VARCHAR (50)  NOT NULL,
    [LoadDate]                  DATETIME2 (7) CONSTRAINT [DF__LinkWellO__LoadD__00750D23] DEFAULT (getdate()) NOT NULL,
    [WellOriginWellboreHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_LinkWellOriginWellbore] PRIMARY KEY NONCLUSTERED ([WellOriginWellboreHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkWellOriginWellbore] UNIQUE NONCLUSTERED ([WellOriginHashKey] ASC, [WellboreHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

