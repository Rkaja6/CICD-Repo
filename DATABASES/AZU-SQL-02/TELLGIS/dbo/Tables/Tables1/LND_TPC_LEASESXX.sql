CREATE TABLE [dbo].[LND_TPC_LEASESXX] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [Agreement]         NVARCHAR (150)   NULL,
    [ELS_Agreem]        NVARCHAR (254)   NULL,
    [Samson_Agr]        NVARCHAR (254)   NULL,
    [Parish]            NVARCHAR (254)   NULL,
    [Township]          NVARCHAR (254)   NULL,
    [Section_]          NUMERIC (38, 8)  NULL,
    [Agmt_Type]         NVARCHAR (254)   NULL,
    [Original_L]        NVARCHAR (254)   NULL,
    [Original_1]        NVARCHAR (254)   NULL,
    [Agmt_Date]         DATETIME2 (7)    NULL,
    [Eff_Date]          DATETIME2 (7)    NULL,
    [Term_Month]        NVARCHAR (8)     NULL,
    [Exp_Date]          DATETIME2 (7)    NULL,
    [Ext_Exp_Da]        DATETIME2 (7)    NULL,
    [Property_S]        NVARCHAR (254)   NULL,
    [Roy_Rate]          NUMERIC (38, 8)  NULL,
    [Book]              NVARCHAR (50)    NULL,
    [Page]              NVARCHAR (50)    NULL,
    [Doc_Inst_N]        NVARCHAR (50)    NULL,
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
    [AgreementF]        NVARCHAR (50)    NULL,
    [HBP_UND]           NVARCHAR (25)    NULL,
    [Active]            NVARCHAR (5)     NULL,
    [Activity_U]        DATETIME2 (7)    NULL,
    [Override]          NVARCHAR (5)     NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R606_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g569_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S569_idx]
    ON [dbo].[LND_TPC_LEASESXX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10369569.0247, XMIN = -10468454.8058, YMAX = 3787587.97670001, YMIN = 3724169.4689),
            CELLS_PER_OBJECT = 16
          );

