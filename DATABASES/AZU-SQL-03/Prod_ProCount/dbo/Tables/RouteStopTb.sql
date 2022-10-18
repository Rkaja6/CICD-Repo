CREATE TABLE [dbo].[RouteStopTb] (
    [RouteStopMerrickID] INT            NOT NULL,
    [RouteMerrickID]     INT            NULL,
    [StopName]           VARCHAR (80)   NULL,
    [StopOrder]          FLOAT (53)     NULL,
    [StopComment]        VARCHAR (2000) NULL,
    [ActiveFlag]         INT            NULL,
    [StopType]           INT            NULL,
    [BackgroundTaskFlag] INT            NULL,
    [LastTransmission]   INT            NULL,
    [LastLoadDate]       DATETIME       NULL,
    [LastLoadTime]       CHAR (8)       NULL,
    [TransmitFlag]       INT            NULL,
    [DateTimeStamp]      DATETIME       NULL,
    [UserDateStamp]      DATETIME       NULL,
    [UserTimeStamp]      CHAR (8)       NULL,
    [UserID]             INT            NULL,
    [AccountingID]       VARCHAR (30)   NULL,
    [ProductionID]       VARCHAR (30)   NULL,
    [EngineeringID]      VARCHAR (30)   NULL,
    [LocationMerrickID]  INT            NULL,
    CONSTRAINT [PK_RouteStopTb] PRIMARY KEY CLUSTERED ([RouteStopMerrickID] ASC)
);

