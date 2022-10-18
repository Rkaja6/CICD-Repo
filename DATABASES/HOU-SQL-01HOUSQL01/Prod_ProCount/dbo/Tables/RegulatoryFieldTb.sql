CREATE TABLE [dbo].[RegulatoryFieldTb] (
    [FieldID]               INT          NOT NULL,
    [StateFlag]             INT          NOT NULL,
    [FieldName]             VARCHAR (50) NULL,
    [FieldShortName]        VARCHAR (15) NULL,
    [ActiveFlag]            INT          NULL,
    [AccountingID]          VARCHAR (30) NULL,
    [EngineeringID]         VARCHAR (30) NULL,
    [ProductionID]          VARCHAR (30) NULL,
    [DivisionID]            INT          NULL,
    [AccountingTeamID]      INT          NULL,
    [ProductionTeamID]      INT          NULL,
    [LouisianaStateCode]    VARCHAR (10) NULL,
    [ColoradoStateCode]     VARCHAR (10) NULL,
    [RegulatoryFieldNumber] VARCHAR (30) NULL,
    [RegulatoryAgencyID]    INT          NULL,
    [FieldMerrickID]        INT          NULL,
    [DateTimeStamp]         DATETIME     NULL,
    [UserDateStamp]         DATETIME     NULL,
    [UserTimeStamp]         CHAR (8)     NULL,
    [UserID]                INT          NULL,
    CONSTRAINT [PK_RegulatoryFieldTb] PRIMARY KEY CLUSTERED ([FieldID] ASC, [StateFlag] ASC)
);

