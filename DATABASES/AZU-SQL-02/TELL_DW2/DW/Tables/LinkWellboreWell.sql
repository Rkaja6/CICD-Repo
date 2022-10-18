CREATE TABLE [DW].[LinkWellboreWell] (
    [WellboreHashKey]     CHAR (32)     NOT NULL,
    [WellHashKey]         CHAR (32)     NOT NULL,
    [RecordSource]        VARCHAR (50)  NOT NULL,
    [LoadDate]            DATETIME2 (7) CONSTRAINT [DF__LinkWellb__LoadD__7F80E8EA] DEFAULT (getdate()) NOT NULL,
    [WellboreWellHashKey] BINARY (32)   NOT NULL,
    CONSTRAINT [PK_LinkWellboreWell] PRIMARY KEY NONCLUSTERED ([WellboreWellHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [UK_LinkWellboreWell] UNIQUE NONCLUSTERED ([WellboreHashKey] ASC, [WellHashKey] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

