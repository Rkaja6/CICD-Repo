CREATE TABLE [dbo].[StateNamesTb] (
    [StateCode]       INT          NOT NULL,
    [StateShort]      VARCHAR (2)  NULL,
    [StateName]       VARCHAR (50) NULL,
    [ActiveFlag]      INT          NULL,
    [AccountingID]    VARCHAR (10) NULL,
    [EngineeringID]   VARCHAR (10) NULL,
    [ProductionID]    VARCHAR (10) NULL,
    [DLSProvinceCode] VARCHAR (10) NULL,
    [PrintFlag]       INT          NULL,
    [DateTimeStamp]   DATETIME     NULL,
    [UserDateStamp]   DATETIME     NULL,
    [UserTimeStamp]   CHAR (8)     NULL,
    [UserID]          INT          NULL,
    [PressureBase]    FLOAT (53)   NULL,
    CONSTRAINT [PK_StateNamesTb] PRIMARY KEY CLUSTERED ([StateCode] ASC)
);

