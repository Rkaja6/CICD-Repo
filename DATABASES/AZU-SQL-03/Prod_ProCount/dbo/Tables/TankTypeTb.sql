CREATE TABLE [dbo].[TankTypeTb] (
    [TankTypeMerrickID]        INT          NOT NULL,
    [TankTypeName]             VARCHAR (20) NULL,
    [TankTypeDescription]      VARCHAR (50) NULL,
    [TankTypeDescriptionShort] VARCHAR (6)  NULL,
    [ActiveFlag]               INT          NULL,
    [AccountingID]             VARCHAR (10) NULL,
    [EngineeringID]            VARCHAR (10) NULL,
    [ProductionID]             VARCHAR (10) NULL,
    [DateTimeStamp]            DATETIME     NULL,
    [UserDateStamp]            DATETIME     NULL,
    [UserTimeStamp]            CHAR (8)     NULL,
    [UserID]                   INT          NULL,
    CONSTRAINT [PK_TankTypeTb] PRIMARY KEY CLUSTERED ([TankTypeMerrickID] ASC)
);

