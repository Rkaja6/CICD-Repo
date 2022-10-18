CREATE TABLE [dbo].[a110] (
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
    [GlobalID]          UNIQUEIDENTIFIER DEFAULT ('{00000000-0000-0000-0000-000000000000}') NOT NULL,
    [SDE_STATE_ID]      BIGINT           NOT NULL,
    CONSTRAINT [a110_rowid_ix1] PRIMARY KEY CLUSTERED ([OBJECTID] ASC, [SDE_STATE_ID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [A_g100_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE NONCLUSTERED INDEX [UUID_OID_110_a]
    ON [dbo].[a110]([GlobalID] ASC, [OBJECTID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [a110_state_ix2]
    ON [dbo].[a110]([SDE_STATE_ID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [SA100_idx]
    ON [dbo].[a110] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10369569.0247, XMIN = -10468454.8058, YMAX = 3821027.128, YMIN = 3725873.5439),
            CELLS_PER_OBJECT = 16
          );

