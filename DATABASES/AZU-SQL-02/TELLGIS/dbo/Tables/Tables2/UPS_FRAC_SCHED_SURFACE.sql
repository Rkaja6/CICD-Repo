CREATE TABLE [dbo].[UPS_FRAC_SCHED_SURFACE] (
    [OBJECTID]          INT              NOT NULL,
    [Num]               NVARCHAR (255)   NULL,
    [Region]            NVARCHAR (255)   NULL,
    [State]             NVARCHAR (255)   NULL,
    [County]            NVARCHAR (255)   NULL,
    [Operator]          NVARCHAR (255)   NULL,
    [Well_Name]         NVARCHAR (255)   NULL,
    [Well_API]          NUMERIC (38, 8)  NULL,
    [Frac_Start_Date]   DATETIME2 (7)    NULL,
    [Frac_End_Date]     DATETIME2 (7)    NULL,
    [Surface_Lat]       NUMERIC (38, 8)  NULL,
    [Surface_Long]      NUMERIC (38, 8)  NULL,
    [Bottomhole_Lat]    NUMERIC (38, 8)  NULL,
    [Bottomhole_Long]   NUMERIC (38, 8)  NULL,
    [TVD]               NVARCHAR (255)   NULL,
    [Target_Formation]  NVARCHAR (255)   NULL,
    [Start_In]          NVARCHAR (255)   NULL,
    [Duration_in_days]  NUMERIC (38, 8)  NULL,
    [Reviewed_By]       NVARCHAR (255)   NULL,
    [Risk_Assessments]  NVARCHAR (255)   NULL,
    [Comments]          NVARCHAR (255)   NULL,
    [Last_Update]       DATETIME2 (7)    NULL,
    [Well_API_TXT]      NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R665_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g628_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S628_idx]
    ON [dbo].[UPS_FRAC_SCHED_SURFACE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10391797.8330695, XMIN = -10459459.2412402, YMAX = 3813863.43035292, YMIN = 3727654.12381838)
          );

