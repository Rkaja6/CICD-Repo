CREATE TABLE [dbo].[DI_LANDTRACS] (
    [OBJECTID]          INT              NOT NULL,
    [leaseId]           NUMERIC (38, 8)  NULL,
    [Grantor]           NVARCHAR (64)    NULL,
    [Grantee]           NVARCHAR (64)    NULL,
    [VolPage]           NVARCHAR (64)    NULL,
    [InstType]          NVARCHAR (64)    NULL,
    [InstDate]          DATETIME2 (7)    NULL,
    [instrumentDate]    DATETIME2 (7)    NULL,
    [instrumentMonth]   INT              NULL,
    [instrumentYear]    INT              NULL,
    [countyName]        NVARCHAR (64)    NULL,
    [state]             NVARCHAR (5)     NULL,
    [TermMo]            NUMERIC (38, 8)  NULL,
    [Royalty]           NUMERIC (38, 8)  NULL,
    [RecDate]           DATETIME2 (7)    NULL,
    [EffDate]           DATETIME2 (7)    NULL,
    [Bonus]             NUMERIC (38, 8)  NULL,
    [ExprDate]          DATETIME2 (7)    NULL,
    [ExtBonus]          NUMERIC (38, 8)  NULL,
    [ExtTermMo]         NUMERIC (38, 8)  NULL,
    [AlsGrantee]        NVARCHAR (64)    NULL,
    [GranteeSht]        NVARCHAR (64)    NULL,
    [MinDepth]          NUMERIC (38, 8)  NULL,
    [MaxDepth]          NUMERIC (38, 8)  NULL,
    [GrantorAdr]        NVARCHAR (200)   NULL,
    [GranteeAdr]        NVARCHAR (200)   NULL,
    [RecordNo]          NVARCHAR (64)    NULL,
    [acres]             NUMERIC (38, 8)  NULL,
    [diLink]            NVARCHAR (1570)  NULL,
    [remarks]           NVARCHAR (3999)  NULL,
    [expirationMonth]   INT              NULL,
    [expirationYear]    INT              NULL,
    [termMonths]        SMALLINT         NULL,
    [countyId]          INT              NULL,
    [stateid]           INT              NULL,
    [isBLM]             SMALLINT         NULL,
    [isState]           SMALLINT         NULL,
    [isNominated]       SMALLINT         NULL,
    [isOptions]         SMALLINT         NULL,
    [APIcty]            NVARCHAR (50)    NULL,
    [APIst]             NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R489_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g452_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S452_idx]
    ON [dbo].[DI_LANDTRACS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8399154.3621, XMIN = -13725959.4124, YMAX = 6274923.2522, YMIN = 2941569.9077),
            CELLS_PER_OBJECT = 16
          );

