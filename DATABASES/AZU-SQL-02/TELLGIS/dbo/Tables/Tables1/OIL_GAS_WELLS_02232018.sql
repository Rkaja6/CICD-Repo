CREATE TABLE [dbo].[OIL_GAS_WELLS_02232018] (
    [OBJECTID]                  INT              NOT NULL,
    [API_NUM]                   NVARCHAR (14)    NULL,
    [AREA_USDW_VALUE]           INT              NULL,
    [CLASSIFICATION]            NVARCHAR (3)     NULL,
    [COASTAL_PERMIT_NUM]        NVARCHAR (8)     NULL,
    [COMMENTS]                  NVARCHAR (2000)  NULL,
    [DIRWELL]                   NVARCHAR (12)    NULL,
    [DISTRICT_CODE]             NVARCHAR (5)     NULL,
    [DOC_ACCESS]                NVARCHAR (500)   NULL,
    [EFFECTIVE_DATE]            DATETIME2 (7)    NULL,
    [EXEMPT_29E_FLAG]           NVARCHAR (1)     NULL,
    [FIELD_ID]                  NVARCHAR (4)     NULL,
    [FIELD_NAME]                NVARCHAR (60)    NULL,
    [FORMATIONS]                NVARCHAR (255)   NULL,
    [HYPERLINK]                 NVARCHAR (200)   NULL,
    [INJECTION_RATE]            NUMERIC (38, 8)  NULL,
    [INJECTION_VOLUME]          INT              NULL,
    [INSPECTION_DATE]           DATETIME2 (7)    NULL,
    [INSPECTION_YEAR_INDEX]     NUMERIC (38, 8)  NULL,
    [LAST_RECOMPLETION_DATE]    DATETIME2 (7)    NULL,
    [LAST_TEST_DATE]            DATETIME2 (7)    NULL,
    [LEASE_NUM]                 NVARCHAR (7)     NULL,
    [LEGEND]                    NVARCHAR (12)    NULL,
    [LEGEND_DESC]               NVARCHAR (100)   NULL,
    [LOCATION]                  NVARCHAR (240)   NULL,
    [LOG_REVIEWED_FLAG]         NVARCHAR (1)     NULL,
    [LOWER_PERFS]               NVARCHAR (255)   NULL,
    [LUW_CODE]                  NVARCHAR (6)     NULL,
    [LUW_NAME]                  NVARCHAR (60)    NULL,
    [LUW_TYPE_CODE]             NVARCHAR (5)     NULL,
    [LW_REC_STATUS]             NVARCHAR (1)     NULL,
    [MAX_SIP]                   INT              NULL,
    [MEASURED_DEPTH]            INT              NULL,
    [MERIDIAN]                  NVARCHAR (1)     NULL,
    [MINERAL_INTEREST_FLAG]     NVARCHAR (1)     NULL,
    [MUD_DENSITY]               NUMERIC (38, 8)  NULL,
    [OPERATION_TYPE_CODE]       NVARCHAR (5)     NULL,
    [ORGANIZATION_ID]           NVARCHAR (6)     NULL,
    [ORGOP_LINE_ID]             INT              NULL,
    [ORG_OPER_NAME]             NVARCHAR (40)    NULL,
    [ORIGINAL_COMPLETION_DATE]  DATETIME2 (7)    NULL,
    [ORPHANED_FLAG]             NVARCHAR (1)     NULL,
    [ORPHAN_STATUS_CODE]        NVARCHAR (5)     NULL,
    [ORPHAN_STATUS_DATE]        DATETIME2 (7)    NULL,
    [PARISH_CODE]               NVARCHAR (5)     NULL,
    [PARISH_NAME]               NVARCHAR (20)    NULL,
    [PERMIT_DATE]               DATETIME2 (7)    NULL,
    [PRODUCT_TYPE_CODE]         NVARCHAR (5)     NULL,
    [RESERVOIRS]                NVARCHAR (255)   NULL,
    [SANDS]                     NVARCHAR (255)   NULL,
    [SCOUT_DETAIL]              NVARCHAR (2000)  NULL,
    [SCOUT_MEASURED_DEPTH]      NUMERIC (38, 8)  NULL,
    [SCOUT_REPORT_DATE]         DATETIME2 (7)    NULL,
    [SCOUT_TRUE_VERTICAL_DEPTH] NUMERIC (38, 8)  NULL,
    [SCOUT_WELL_STATUS_CODE]    NVARCHAR (5)     NULL,
    [SECTION]                   NVARCHAR (3)     NULL,
    [SECTN]                     NVARCHAR (3)     NULL,
    [SIP_ASSIGNED_DATE]         DATETIME2 (7)    NULL,
    [SOURCE_AREA_USDW_VALUE]    NVARCHAR (240)   NULL,
    [SOURCE_OF_SIP_VALUE]       NVARCHAR (60)    NULL,
    [SPUD_DATE]                 DATETIME2 (7)    NULL,
    [STATE_INTEREST_FLAG]       NVARCHAR (1)     NULL,
    [SURFACE_COORD_SYSTEM_CODE] NVARCHAR (5)     NULL,
    [SURFACE_LAMBERT_X]         NUMERIC (38, 8)  NULL,
    [SURFACE_LAMBERT_Y]         NUMERIC (38, 8)  NULL,
    [SURFACE_LAT_DEC_DEG]       NUMERIC (38, 8)  NULL,
    [SURFACE_LONG_DEC_DEG]      NUMERIC (38, 8)  NULL,
    [SURFACE_UTM83_X]           NUMERIC (38, 8)  NULL,
    [SURFACE_UTM83_Y]           NUMERIC (38, 8)  NULL,
    [SURFACE_ZONE]              NVARCHAR (1)     NULL,
    [TOWNSHIP]                  NVARCHAR (3)     NULL,
    [UNIT_WELL_FLAG]            NVARCHAR (1)     NULL,
    [UPPER_PERFS]               NVARCHAR (255)   NULL,
    [USDW_VALUE]                INT              NULL,
    [WELL_CLASS_TYPE_CODE]      NVARCHAR (5)     NULL,
    [WELL_NAME]                 NVARCHAR (60)    NULL,
    [WELL_NUM]                  NVARCHAR (7)     NULL,
    [WELL_RANGE]                NVARCHAR (3)     NULL,
    [WELL_SERIAL_NUM]           INT              NOT NULL,
    [WELL_STATUS_CODE]          NVARCHAR (5)     NULL,
    [WELL_STATUS_DATE]          DATETIME2 (7)    NULL,
    [Shape]                     [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]         VARBINARY (MAX)  NULL,
    CONSTRAINT [R39_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g29_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S29_idx]
    ON [dbo].[OIL_GAS_WELLS_02232018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

