CREATE TABLE [dbo].[DataQuality] (
    [Id]                      BIGINT         NULL,
    [Confidential_Data_Group] NVARCHAR (MAX) NULL,
    [Initial_Test_Data_Group] NVARCHAR (MAX) NULL,
    [Production_Data_Group]   NVARCHAR (MAX) NULL,
    [TellurianUpdatedDate]    DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]    DATETIME       DEFAULT (getdate()) NULL
);

