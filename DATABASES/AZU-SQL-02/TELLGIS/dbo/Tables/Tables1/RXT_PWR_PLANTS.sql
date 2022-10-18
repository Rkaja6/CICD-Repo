CREATE TABLE [dbo].[RXT_PWR_PLANTS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [PLANT_CODE]        NUMERIC (38, 8)  NULL,
    [UTILITY_ID]        NUMERIC (38, 8)  NULL,
    [UTILITY_NM]        NVARCHAR (70)    NULL,
    [OWNTRND_ID]        NUMERIC (38, 8)  NULL,
    [OWNTRNDIST]        NVARCHAR (254)   NULL,
    [PRIM_PURP]         NUMERIC (38, 8)  NULL,
    [TITLE]             NVARCHAR (100)   NULL,
    [NERC]              NVARCHAR (60)    NULL,
    [NM_WTR_SRC]        NVARCHAR (50)    NULL,
    [REG_STATUS]        NVARCHAR (4)     NULL,
    [FERC_COGEN]        NVARCHAR (1)     NULL,
    [SECTORNMBR]        NUMERIC (38, 8)  NULL,
    [SECTORNAME]        NVARCHAR (254)   NULL,
    [EXST_NMPLT]        NUMERIC (38, 8)  NULL,
    [PROP_NMPLT]        NUMERIC (38, 8)  NULL,
    [RETIPNMPLT]        NUMERIC (38, 8)  NULL,
    [ENRGSRC_1]         NVARCHAR (3)     NULL,
    [ENRGSRC_2]         NVARCHAR (3)     NULL,
    [ENRGSRC_3]         NVARCHAR (3)     NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [PREV_OWNER]        NVARCHAR (50)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R172_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g153_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S153_idx]
    ON [dbo].[RXT_PWR_PLANTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7459536.4289, XMIN = -19113004.2313, YMAX = 11503045.1999, YMIN = 2154312.3575),
            CELLS_PER_OBJECT = 16
          );

