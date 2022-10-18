CREATE TABLE [dbo].[StateCountyNamesTb] (
    [StateCode]     INT          NOT NULL,
    [CountyCode]    INT          NOT NULL,
    [CountyName]    VARCHAR (50) NULL,
    [ActiveFlag]    INT          NULL,
    [RegulatoryId]  VARCHAR (10) NULL,
    [AccountingID]  VARCHAR (50) NULL,
    [EngineeringID] VARCHAR (10) NULL,
    [ProductionID]  VARCHAR (10) NULL,
    [PrintFlag]     INT          NULL,
    [DateTimeStamp] DATETIME     NULL,
    [UserDateStamp] DATETIME     NULL,
    [UserTimeStamp] CHAR (8)     NULL,
    [UserID]        INT          NULL,
    CONSTRAINT [PK_StateCountyNamesTb] PRIMARY KEY CLUSTERED ([StateCode] ASC, [CountyCode] ASC)
);

