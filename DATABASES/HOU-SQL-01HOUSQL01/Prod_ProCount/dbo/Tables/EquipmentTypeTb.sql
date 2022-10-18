CREATE TABLE [dbo].[EquipmentTypeTb] (
    [EquipmentTypeMerrickID] INT          NOT NULL,
    [EquipmentName]          VARCHAR (50) NULL,
    [EquipmentNameShort]     VARCHAR (6)  NULL,
    [ActiveFlag]             INT          NULL,
    [AccountingID]           VARCHAR (10) NULL,
    [EngineeringID]          VARCHAR (10) NULL,
    [ProductionID]           VARCHAR (10) NULL,
    [EntryScreenType]        INT          NOT NULL,
    [DateTimeStamp]          DATETIME     NULL,
    [UserDateStamp]          DATETIME     NULL,
    [UserTimeStamp]          CHAR (8)     NULL,
    [UserID]                 INT          NULL,
    CONSTRAINT [PK_EquipmentTypeTb] PRIMARY KEY CLUSTERED ([EquipmentTypeMerrickID] ASC)
);

