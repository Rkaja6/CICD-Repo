CREATE TABLE [dbo].[ProductTypeTb] (
    [MerrickID]              INT          NOT NULL,
    [ProductTypeDescription] VARCHAR (50) NULL,
    [ProductTypeShort]       VARCHAR (16) NULL,
    [ActiveFlag]             INT          NULL,
    [ProductionID]           VARCHAR (30) NULL,
    [AccountingID]           VARCHAR (30) NULL,
    [EngineeringID]          VARCHAR (30) NULL,
    [BillingID]              VARCHAR (10) NULL,
    [NewMexicoStateCode]     INT          NULL,
    [LouisianaStateCode]     VARCHAR (10) NULL,
    [StateRegulatoryID]      VARCHAR (10) NULL,
    [FederalRegulatoryID]    VARCHAR (10) NULL,
    [InternalID]             VARCHAR (10) NULL,
    [DateTimeStamp]          DATETIME     NULL,
    [UserDateStamp]          DATETIME     NULL,
    [UserTimeStamp]          CHAR (8)     NULL,
    [UserID]                 INT          NULL,
    CONSTRAINT [PK_ProductTypeTb] PRIMARY KEY CLUSTERED ([MerrickID] ASC)
);

