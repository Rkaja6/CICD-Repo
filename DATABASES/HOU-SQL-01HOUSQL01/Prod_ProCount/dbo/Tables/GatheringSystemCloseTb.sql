CREATE TABLE [dbo].[GatheringSystemCloseTb] (
    [GatheringSystemID]     INT      NOT NULL,
    [RecordMonth]           DATETIME NOT NULL,
    [AllocationLockedFlag]  INT      NULL,
    [AllocationSkippedFlag] INT      NULL,
    [AccountingClosedFlag]  INT      NULL,
    [OpenDate]              DATETIME NULL,
    [UploadDate]            DATETIME NULL,
    [PrintFlag]             INT      NULL,
    [UserDateStamp]         DATETIME NULL,
    [UserTimeStamp]         CHAR (8) NULL,
    [UserID]                INT      NULL,
    [ProcessedFlag]         INT      NULL,
    [AccountingCostFlag]    INT      NULL,
    CONSTRAINT [PK_GatheringSystemCloseTb] PRIMARY KEY CLUSTERED ([GatheringSystemID] ASC, [RecordMonth] ASC)
);

