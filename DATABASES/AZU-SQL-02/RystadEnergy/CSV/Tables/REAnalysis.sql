CREATE TABLE [CSV].[REAnalysis] (
    [Id]                   SMALLINT      NULL,
    [Refracturing Group]   VARCHAR (28)  NULL,
    [Pad Drilling Group]   VARCHAR (40)  NULL,
    [Unconventional Group] VARCHAR (28)  NULL,
    [TellurianUpdatedDate] DATETIME2 (7) DEFAULT (getdate()) NULL,
    [TellurianCreatedDate] DATETIME2 (7) DEFAULT (getdate()) NULL
);

