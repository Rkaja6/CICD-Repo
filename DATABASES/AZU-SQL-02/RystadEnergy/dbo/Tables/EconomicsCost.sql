CREATE TABLE [dbo].[EconomicsCost] (
    [Id]                   BIGINT         NULL,
    [API_Number]           NVARCHAR (MAX) NULL,
    [Well_Cost_Group]      NVARCHAR (MAX) NULL,
    [Well_Cost__MUSD_]     REAL           NULL,
    [Well_Cost_Category]   NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate] DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate] DATETIME       DEFAULT (getdate()) NULL
);

