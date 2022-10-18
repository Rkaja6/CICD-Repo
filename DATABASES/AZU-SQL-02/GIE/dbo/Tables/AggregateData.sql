﻿CREATE TABLE [dbo].[AggregateData] (
    [id]                   VARCHAR (200) NOT NULL,
    [dataSet]              SMALLINT      NULL,
    [dataSetLabel]         VARCHAR (20)  NOT NULL,
    [indicator]            VARCHAR (46)  NULL,
    [periodType]           VARCHAR (3)   NULL,
    [periodFrom]           DATETIME      NULL,
    [periodTo]             DATETIME      NULL,
    [countryKey]           VARCHAR (11)  NULL,
    [countryLabel]         VARCHAR (50)  NULL,
    [bzKey]                VARCHAR (20)  NULL,
    [bzShort]              VARCHAR (50)  NULL,
    [bzLong]               VARCHAR (400) NULL,
    [operatorKey]          VARCHAR (11)  NULL,
    [operatorLabel]        VARCHAR (43)  NULL,
    [tsoEicCode]           VARCHAR (16)  NULL,
    [directionKey]         VARCHAR (5)   NULL,
    [adjacentSystemsKey]   VARCHAR (200) NULL,
    [adjacentSystemsLabel] VARCHAR (50)  NULL,
    [year]                 SMALLINT      NULL,
    [month]                SMALLINT      NULL,
    [day]                  SMALLINT      NULL,
    [unit]                 VARCHAR (7)   NULL,
    [value]                REAL          NULL,
    [countPointPresents]   SMALLINT      NULL,
    [flowStatus]           VARCHAR (20)  NULL,
    [pointsNames]          VARCHAR (400) NULL,
    [lastUpdateDateTime]   DATETIME      NULL,
    CONSTRAINT [pk_AggregateDataId] PRIMARY KEY CLUSTERED ([id] ASC)
);

