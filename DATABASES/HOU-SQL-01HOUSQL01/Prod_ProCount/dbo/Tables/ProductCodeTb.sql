﻿CREATE TABLE [dbo].[ProductCodeTb] (
    [MerrickID]              INT          NOT NULL,
    [ProductTypeID]          INT          NULL,
    [ProductCodeDescription] VARCHAR (50) NULL,
    [ProductCodeShort]       VARCHAR (16) NULL,
    [ActiveFlag]             INT          NULL,
    [OilGasWaterFlag]        INT          NULL,
    [AccountingUploadFlag]   INT          NULL,
    [EngineeringUploadFlag]  INT          NULL,
    [AccountingID]           VARCHAR (30) NULL,
    [EngineeringID]          VARCHAR (30) NULL,
    [ProductionID]           VARCHAR (30) NULL,
    [BillingID]              VARCHAR (10) NULL,
    [MMSOgorProductCode]     VARCHAR (10) NULL,
    [WyomingStateCode]       VARCHAR (10) NULL,
    [ColoradoStateCode]      VARCHAR (10) NULL,
    [NorthDakotaStateCode]   VARCHAR (10) NULL,
    [InternalID]             VARCHAR (10) NULL,
    [StateRegulatoryID]      VARCHAR (10) NULL,
    [FederalRegulatoryID]    VARCHAR (10) NULL,
    [DateTimeStamp]          DATETIME     NULL,
    [UserDateStamp]          DATETIME     NULL,
    [UserTimeStamp]          CHAR (8)     NULL,
    [UserID]                 INT          NULL,
    CONSTRAINT [PK_ProductCodeTb] PRIMARY KEY CLUSTERED ([MerrickID] ASC)
);
