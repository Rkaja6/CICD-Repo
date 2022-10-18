CREATE TABLE [dbo].[REAnalysis] (
    [Id]                   BIGINT         NULL,
    [Refracturing_Group]   NVARCHAR (MAX) NULL,
    [Pad_Drilling_Group]   NVARCHAR (MAX) NULL,
    [Unconventional_Group] NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate] DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate] DATETIME       DEFAULT (getdate()) NULL
);

