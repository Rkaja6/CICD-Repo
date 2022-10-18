CREATE TABLE [dbo].[RouteStopItemTb] (
    [RouteStopMerrickID] INT          NOT NULL,
    [ObjectMerrickID]    INT          NOT NULL,
    [ObjectMerrickType]  INT          NOT NULL,
    [ItemOrder]          FLOAT (53)   NULL,
    [StopType]           INT          NULL,
    [DisplayOil]         FLOAT (53)   NULL,
    [DisplayGas]         FLOAT (53)   NULL,
    [DisplayWater]       FLOAT (53)   NULL,
    [DisplayMessage]     VARCHAR (80) NULL,
    [BackgroundTaskFlag] INT          NULL,
    [LastTransmission]   INT          NULL,
    [LastLoadDate]       DATETIME     NULL,
    [LastLoadTime]       CHAR (8)     NULL,
    [TransmitFlag]       INT          NULL,
    [DateTimeStamp]      DATETIME     NULL,
    [UserDateStamp]      DATETIME     NULL,
    [UserTimeStamp]      CHAR (8)     NULL,
    [UserID]             INT          NULL,
    CONSTRAINT [PK_RouteStopItemTb] PRIMARY KEY CLUSTERED ([RouteStopMerrickID] ASC, [ObjectMerrickID] ASC, [ObjectMerrickType] ASC)
);

