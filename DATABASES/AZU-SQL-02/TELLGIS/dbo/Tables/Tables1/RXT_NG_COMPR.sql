CREATE TABLE [dbo].[RXT_NG_COMPR] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (150)   NULL,
    [OPER_STAT]         NVARCHAR (20)    NULL,
    [INTERSTATE]        NVARCHAR (3)     NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [HP]                NUMERIC (38, 8)  NULL,
    [FUEL_TYPE]         NVARCHAR (10)    NULL,
    [FUEL_MCFD]         NUMERIC (38, 8)  NULL,
    [BIDIRECT]          NVARCHAR (2)     NULL,
    [STATE]             NVARCHAR (30)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [NOTES]             NVARCHAR (150)   NULL,
    [PREV_OWNER]        NVARCHAR (50)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [RQCHECK]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R158_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g139_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S139_idx]
    ON [dbo].[RXT_NG_COMPR] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -6970267.8884, XMIN = -14302336.9187, YMAX = 8258027.0456, YMIN = 2005013.1933),
            CELLS_PER_OBJECT = 16
          );

