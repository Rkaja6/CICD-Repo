CREATE TABLE [dbo].[CompletionConnectCrossTb] (
    [MerrickID]         INT      NOT NULL,
    [SourceID]          INT      NOT NULL,
    [SourceType]        INT      NOT NULL,
    [StartDate]         DATETIME NOT NULL,
    [EndDate]           DATETIME NOT NULL,
    [GatheringSystemID] INT      NULL,
    [UserDateStamp]     DATETIME NULL,
    [UserTimeStamp]     CHAR (8) NULL,
    [UserID]            INT      NULL,
    CONSTRAINT [PK_CompletionConnectCrossTb] PRIMARY KEY CLUSTERED ([MerrickID] ASC, [SourceID] ASC, [SourceType] ASC, [StartDate] ASC, [EndDate] ASC)
);

