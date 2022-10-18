CREATE TABLE [dbo].[LND_ENSIGHT_LEASESX] (
    [OBJECTID]          INT              NOT NULL,
    [Id]                INT              NULL,
    [Tract_No]          NVARCHAR (50)    NULL,
    [Lease_No]          NVARCHAR (50)    NULL,
    [Cum_Gross]         NUMERIC (38, 8)  NULL,
    [Status]            NVARCHAR (30)    NULL,
    [Parish]            NVARCHAR (50)    NULL,
    [Lessor]            NVARCHAR (254)   NULL,
    [Lessee]            NVARCHAR (254)   NULL,
    [Lease_Date]        DATETIME2 (7)    NULL,
    [Eff_Date]          DATETIME2 (7)    NULL,
    [Exp_Date]          DATETIME2 (7)    NULL,
    [Term_Mos]          NVARCHAR (40)    NULL,
    [Bonus]             NUMERIC (38, 8)  NULL,
    [Bonus_Acre]        NUMERIC (38, 8)  NULL,
    [Option_Mos]        NVARCHAR (20)    NULL,
    [Opt_Bonus]         NUMERIC (38, 8)  NULL,
    [Opt_Acre]          NUMERIC (38, 8)  NULL,
    [Opt_Exerci]        NVARCHAR (20)    NULL,
    [Opt_Exp]           DATETIME2 (7)    NULL,
    [Royalty]           NUMERIC (38, 8)  NULL,
    [Recording]         NVARCHAR (50)    NULL,
    [Pugh]              NVARCHAR (20)    NULL,
    [Pugh_Vert]         NVARCHAR (20)    NULL,
    [Exp_Month]         NVARCHAR (25)    NULL,
    [Exp_Yr]            NVARCHAR (8)     NULL,
    [Map_Label]         NVARCHAR (50)    NULL,
    [Map_Status]        NVARCHAR (25)    NULL,
    [Lease_Net]         NUMERIC (38, 8)  NULL,
    [HA_Net]            NUMERIC (38, 8)  NULL,
    [Gross]             NUMERIC (38, 8)  NULL,
    [Co_Net]            NUMERIC (38, 8)  NULL,
    [NRI]               NUMERIC (38, 8)  NULL,
    [Section]           NVARCHAR (15)    NULL,
    [Township]          NVARCHAR (15)    NULL,
    [Range]             NVARCHAR (15)    NULL,
    [State]             NVARCHAR (15)    NULL,
    [Cost_Free]         NVARCHAR (10)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R757_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g720_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S720_idx]
    ON [dbo].[LND_ENSIGHT_LEASESX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10394211.5307545, XMIN = -10468123.3927933, YMAX = 3823051.31622196, YMIN = 3771774.13991052)
          );

