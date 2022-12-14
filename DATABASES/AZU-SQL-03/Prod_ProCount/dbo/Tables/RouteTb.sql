CREATE TABLE [dbo].[RouteTb] (
    [RouteMerrickID]        INT          NOT NULL,
    [RouteName]             VARCHAR (40) NULL,
    [RouteDescription]      VARCHAR (80) NULL,
    [RouteComment]          VARCHAR (80) NULL,
    [PumperID]              INT          NULL,
    [PumperID2]             INT          NULL,
    [PumperID3]             INT          NULL,
    [PumperID4]             INT          NULL,
    [PumperID5]             INT          NULL,
    [PumperID6]             INT          NULL,
    [ForemanID]             INT          NULL,
    [ForemanID2]            INT          NULL,
    [ForemanID3]            INT          NULL,
    [ForemanID4]            INT          NULL,
    [AccountantID]          INT          NULL,
    [AccountantID2]         INT          NULL,
    [AccountantID3]         INT          NULL,
    [AccountantID4]         INT          NULL,
    [ActiveFlag]            INT          NULL,
    [StartActiveDate]       DATETIME     NULL,
    [EndActiveDate]         DATETIME     NULL,
    [DivisionID]            INT          NULL,
    [AccountingTeamID]      INT          NULL,
    [ProductionTeamID]      INT          NULL,
    [LatestCompletedDate]   DATETIME     NULL,
    [LatestUploadedDate]    DATETIME     NULL,
    [AllocateOnReplication] INT          NULL,
    [SourceMeterOil]        INT          NULL,
    [SourceMeterGas]        INT          NULL,
    [SourceMeterWater]      INT          NULL,
    [SourceMeterOilInj]     INT          NULL,
    [SourceMeterGasInj]     INT          NULL,
    [SourceMeterWaterInj]   INT          NULL,
    [LatestMessageDate]     DATETIME     NULL,
    [LatestMessage]         VARCHAR (25) NULL,
    [PrintFlag]             INT          NULL,
    [BackgroundTaskFlag]    INT          NULL,
    [LastTransmission]      INT          NULL,
    [LastLoadDate]          DATETIME     NULL,
    [LastLoadTime]          CHAR (8)     NULL,
    [TransmitFlag]          INT          NULL,
    [DateTimeStamp]         DATETIME     NULL,
    [UserDateStamp]         DATETIME     NULL,
    [UserTimeStamp]         CHAR (8)     NULL,
    [UserID]                INT          NULL,
    [AccountingID]          VARCHAR (30) NULL,
    [ProductionID]          VARCHAR (30) NULL,
    [EngineeringID]         VARCHAR (30) NULL,
    CONSTRAINT [PK_RouteTb] PRIMARY KEY CLUSTERED ([RouteMerrickID] ASC)
);

