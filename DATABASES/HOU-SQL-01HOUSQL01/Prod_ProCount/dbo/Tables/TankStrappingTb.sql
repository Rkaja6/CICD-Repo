CREATE TABLE [dbo].[TankStrappingTb] (
    [TankID]             INT              NOT NULL,
    [RecordDate]         DATETIME         NOT NULL,
    [Description]        VARCHAR (100)    NULL,
    [PurchaserBEID]      INT              NULL,
    [PurchaserTankID]    VARCHAR (20)     NULL,
    [StrappingDataType]  INT              NULL,
    [TotalTankCapacity]  FLOAT (53)       NULL,
    [EffectiveDate]      DATETIME         NULL,
    [BackgroundTaskFlag] INT              NULL,
    [LastTransmission]   INT              NULL,
    [LastLoadDate]       DATETIME         NULL,
    [LastLoadTime]       CHAR (8)         NULL,
    [TransmitFlag]       INT              NULL,
    [DateTimeStamp]      DATETIME         NULL,
    [BLogicDateStamp]    DATETIME         NULL,
    [BLogicTimeStamp]    CHAR (8)         NULL,
    [UserDateStamp]      DATETIME         NULL,
    [UserTimeStamp]      CHAR (8)         NULL,
    [UserID]             INT              NULL,
    [RowUID]             UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_TankStrappingTb] PRIMARY KEY CLUSTERED ([TankID] ASC, [RecordDate] ASC)
);

