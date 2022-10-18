CREATE TABLE [dbo].[RXT_TERMINALS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [STO_CAP]           NUMERIC (38, 8)  NULL,
    [TRANS_CAP]         INT              NULL,
    [CRUDE_OIL]         NVARCHAR (5)     NULL,
    [REF_PROD]          NVARCHAR (5)     NULL,
    [OTHER_LIQ]         NVARCHAR (3)     NULL,
    [OTHERS]            NVARCHAR (3)     NULL,
    [COM_DET]           NVARCHAR (254)   NULL,
    [NO_TANKS]          INT              NULL,
    [AC_PIPE]           NVARCHAR (5)     NULL,
    [AC_RAIL]           NVARCHAR (5)     NULL,
    [AC_TRUCK]          NVARCHAR (5)     NULL,
    [AC_WATER]          NVARCHAR (5)     NULL,
    [PIPE_SERV]         NVARCHAR (150)   NULL,
    [RAIL_SERV]         NVARCHAR (60)    NULL,
    [R_FAC_TYPE]        NVARCHAR (20)    NULL,
    [R_TRANSLOAD]       NVARCHAR (30)    NULL,
    [R_SERVICE]         NVARCHAR (20)    NULL,
    [STARTDATE]         DATETIME2 (7)    NULL,
    [PREV_OWNER]        NVARCHAR (200)   NULL,
    [TRANS_DATE]        DATETIME2 (7)    NULL,
    [TRANS_NOTE]        NVARCHAR (254)   NULL,
    [TRANS_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [LOC_DOCS]          NVARCHAR (254)   NULL,
    [SUBOPER_ID]        NVARCHAR (10)    NULL,
    [OPER_ID]           NVARCHAR (10)    NULL,
    [OPER_URL]          NVARCHAR (254)   NULL,
    [OPER_DOCS]         NVARCHAR (254)   NULL,
    [OWNER_ID]          NVARCHAR (10)    NULL,
    [OWNER_URL]         NVARCHAR (254)   NULL,
    [OWNER_DOCS]        NVARCHAR (254)   NULL,
    [CONTACTS_URL]      NVARCHAR (254)   NULL,
    [CATCHALL]          NVARCHAR (500)   NULL,
    [NOTES]             NVARCHAR (300)   NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [QUALITY]           NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R519_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g482_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S482_idx]
    ON [dbo].[RXT_TERMINALS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -5866496.4792, XMIN = -19664003.5883, YMAX = 11219630.8407, YMIN = 1677329.4801)
          );

