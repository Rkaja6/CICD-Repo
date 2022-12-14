CREATE TABLE [dbo].[DI_WELLS_DIRECTIONALS_NOGEOM] (
    [OBJECTID]            INT             NOT NULL,
    [wellId]              INT             NULL,
    [countyId]            INT             NULL,
    [state]               NVARCHAR (5)    NOT NULL,
    [countyName]          NVARCHAR (63)   NOT NULL,
    [APIst]               NVARCHAR (2)    NULL,
    [APIcty]              NVARCHAR (3)    NULL,
    [API]                 NVARCHAR (16)   NULL,
    [abstractId]          INT             NULL,
    [permitId]            INT             NULL,
    [g1Id]                INT             NULL,
    [bottoms_w2Id]        INT             NULL,
    [surfaceLatitude]     NUMERIC (38, 8) NULL,
    [surfaceLongitude]    NUMERIC (38, 8) NULL,
    [bottomHoleLatitude]  NUMERIC (38, 8) NULL,
    [bottomHoleLongitude] NUMERIC (38, 8) NULL,
    [priorWellType]       NVARCHAR (50)   NULL,
    [currentWellType]     NVARCHAR (255)  NULL,
    [priorWellStatusId]   INT             NULL,
    [priorWellStatus]     NVARCHAR (100)  NULL,
    [currentWellStatus]   NVARCHAR (255)  NULL,
    [DEFlag]              NVARCHAR (32)   NULL,
    [removed]             SMALLINT        NULL,
    [lineItem]            INT             NULL,
    [end_loc]             NVARCHAR (25)   NULL,
    [loc_quality]         INT             NULL,
    [created]             DATETIME2 (7)   NULL,
    [updated]             DATETIME2 (7)   NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R133_SDE_ROWID_UK]
    ON [dbo].[DI_WELLS_DIRECTIONALS_NOGEOM]([OBJECTID] ASC) WITH (FILLFACTOR = 75);

