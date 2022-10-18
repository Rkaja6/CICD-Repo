CREATE TABLE [dbo].[WellInfo] (
    [Id]                         BIGINT         NULL,
    [API_Number]                 NVARCHAR (MAX) NULL,
    [Year]                       SMALLINT       NULL,
    [Month]                      SMALLINT       NULL,
    [Oil_And_Gas_Group]          NVARCHAR (MAX) NULL,
    [Cumulative_Calendar_Months] SMALLINT       NULL,
    [Cumulative_Calendar_Years]  SMALLINT       NULL,
    [Rig_Demand]                 VARCHAR (50)   NULL,
    [Spudded_Wells]              INT            NULL,
    [Completed_Wells]            INT            NULL,
    [Started_Wells]              INT            NULL,
    [Producing_Wells]            INT            NULL,
    [TellurianUpdatedDate]       DATETIME       DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]       DATETIME       DEFAULT (getdate()) NULL
);

