CREATE TABLE [dbo].[DI_RIGS_AUGUST2018] (
    [OBJECTID]             INT              NOT NULL,
    [api_number]           NVARCHAR (50)    NULL,
    [state_name]           NVARCHAR (50)    NULL,
    [district_name]        NVARCHAR (50)    NULL,
    [county_name]          NVARCHAR (50)    NULL,
    [contractor_name]      NVARCHAR (50)    NULL,
    [rig_number]           NVARCHAR (50)    NULL,
    [draw_works]           NVARCHAR (50)    NULL,
    [rated_hp]             SMALLINT         NULL,
    [lease_name]           NVARCHAR (50)    NULL,
    [well_number]          NVARCHAR (50)    NULL,
    [spud_date]            DATETIME2 (7)    NULL,
    [release_date]         DATETIME2 (7)    NULL,
    [rig_lat]              NUMERIC (38, 8)  NULL,
    [rig_long]             NUMERIC (38, 8)  NULL,
    [permit_id]            INT              NULL,
    [permit_number]        NVARCHAR (30)    NULL,
    [permit_approval_date] DATETIME2 (7)    NULL,
    [permit_posted_date]   DATETIME2 (7)    NULL,
    [permit_depth]         INT              NULL,
    [commodity]            NVARCHAR (50)    NULL,
    [well_purpose]         NVARCHAR (50)    NULL,
    [well_orientation]     NVARCHAR (1)     NULL,
    [field_name]           NVARCHAR (120)   NULL,
    [formation]            NVARCHAR (120)   NULL,
    [formation_depth]      INT              NULL,
    [rated_water_depth]    INT              NULL,
    [h2s_area]             NVARCHAR (3)     NULL,
    [contractor_address]   NVARCHAR (50)    NULL,
    [contractor_city]      NVARCHAR (50)    NULL,
    [contractor_state]     NVARCHAR (2)     NULL,
    [contractor_zip]       NVARCHAR (5)     NULL,
    [contractor_phone]     NVARCHAR (50)    NULL,
    [contractor_website]   NVARCHAR (50)    NULL,
    [contractor_contact]   NVARCHAR (50)    NULL,
    [contractor_email]     NVARCHAR (50)    NULL,
    [operator_name]        NVARCHAR (255)   NULL,
    [operator_address]     NVARCHAR (120)   NULL,
    [operator_city]        NVARCHAR (120)   NULL,
    [operator_state]       NVARCHAR (120)   NULL,
    [operator_zip]         NVARCHAR (50)    NULL,
    [operator_phone]       NVARCHAR (50)    NULL,
    [operator_contact]     NVARCHAR (120)   NULL,
    [rig_id]               SMALLINT         NULL,
    [last_update]          DATETIME2 (7)    NULL,
    [diLink]               NVARCHAR (3999)  NULL,
    [Shape]                [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]    VARBINARY (MAX)  NULL,
    CONSTRAINT [R227_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g208_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S208_idx]
    ON [dbo].[DI_RIGS_AUGUST2018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8441415.5854, XMIN = -16699465.1045, YMAX = 11204436.6515, YMIN = 3275184.0711),
            CELLS_PER_OBJECT = 16
          );

