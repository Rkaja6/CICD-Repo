CREATE TABLE [dbo].[LND_TPC_LEASES_04082018] (
    [OBJECTID]          INT              NOT NULL,
    [Agreement]         NVARCHAR (150)   NULL,
    [ELS_Agreem]        NVARCHAR (254)   NULL,
    [Samson_Agr]        NVARCHAR (254)   NULL,
    [Parish]            NVARCHAR (254)   NULL,
    [Township]          NVARCHAR (254)   NULL,
    [Section]           NUMERIC (38, 8)  NULL,
    [Agmt_Type]         NVARCHAR (254)   NULL,
    [Original_L]        NVARCHAR (254)   NULL,
    [Original_1]        NVARCHAR (254)   NULL,
    [Agmt_Date]         DATETIME2 (7)    NULL,
    [Eff_Date]          DATETIME2 (7)    NULL,
    [Term__Mont]        DATETIME2 (7)    NULL,
    [Exp_Date]          DATETIME2 (7)    NULL,
    [Ext_Exp_Da]        DATETIME2 (7)    NULL,
    [Property_S]        NVARCHAR (254)   NULL,
    [Roy_Rate]          NUMERIC (38, 8)  NULL,
    [Book]              NUMERIC (38, 8)  NULL,
    [Page]              NUMERIC (38, 8)  NULL,
    [Doc_Inst_N]        NUMERIC (38, 8)  NULL,
    [Agmt_Gross]        NUMERIC (38, 8)  NULL,
    [Agmt_Net]          NUMERIC (38, 8)  NULL,
    [Claimed_Ac]        NUMERIC (38, 8)  NULL,
    [Confirmed]         NUMERIC (38, 8)  NULL,
    [Tract_Gros]        NUMERIC (38, 8)  NULL,
    [Interest]          NUMERIC (38, 8)  NULL,
    [Tract_Net]         NUMERIC (38, 8)  NULL,
    [Notice]            NVARCHAR (254)   NULL,
    [Consent]           NVARCHAR (254)   NULL,
    [Consent__]         NVARCHAR (254)   NULL,
    [Pugh_Geogr]        NVARCHAR (254)   NULL,
    [Pugh_Strat]        NVARCHAR (254)   NULL,
    [Legal_Desc]        NVARCHAR (254)   NULL,
    [Label]             NVARCHAR (250)   NULL,
    [AgreementFormat]   NVARCHAR (50)    NULL,
    [HBP_UND]           NVARCHAR (25)    NULL,
    [Active]            NVARCHAR (5)     NULL,
    [Activity_Update]   DATETIME2 (7)    NULL,
    [Override]          NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R68_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g58_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S58_idx]
    ON [dbo].[LND_TPC_LEASES_04082018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

