CREATE TABLE [dbo].[DI_WELLS_NOGEOM] (
    [OBJECTID]          INT             NOT NULL,
    [wellId]            INT             NOT NULL,
    [stateId]           INT             NOT NULL,
    [countyId]          INT             NOT NULL,
    [APIst]             NVARCHAR (2)    NULL,
    [APIcty]            NVARCHAR (3)    NULL,
    [API]               NVARCHAR (16)   NULL,
    [state]             NVARCHAR (2)    NULL,
    [countyName]        NVARCHAR (255)  NULL,
    [latitude]          NUMERIC (38, 8) NULL,
    [longitude]         NUMERIC (38, 8) NULL,
    [abstractId]        INT             NULL,
    [priorWellTypeCode] NVARCHAR (2)    NULL,
    [priorWellType]     NVARCHAR (50)   NULL,
    [currentWellType]   NVARCHAR (255)  NULL,
    [operId]            INT             NULL,
    [operator]          NVARCHAR (100)  NULL,
    [operatorAlias]     NVARCHAR (255)  NULL,
    [TD]                INT             NULL,
    [wellNo]            NVARCHAR (32)   NULL,
    [leaseNm]           NVARCHAR (128)  NULL,
    [spudDate]          DATETIME2 (7)   NULL,
    [elev]              INT             NULL,
    [elev_ref]          NVARCHAR (8)    NULL,
    [priorWellStatusId] INT             NULL,
    [priorWellStatus]   NVARCHAR (100)  NULL,
    [currentWellStatus] NVARCHAR (255)  NULL,
    [created]           DATETIME2 (7)   NULL,
    [updated]           DATETIME2 (7)   NULL,
    [diLink]            NVARCHAR (4000) NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R132_SDE_ROWID_UK]
    ON [dbo].[DI_WELLS_NOGEOM]([OBJECTID] ASC) WITH (FILLFACTOR = 75);

