CREATE TABLE [dbo].[UPS_FRAC_SCHED_STICKS] (
    [OBJECTID_1]        INT              NOT NULL,
    [Num]               NVARCHAR (255)   NULL,
    [Surface_Lat]       NUMERIC (38, 8)  NULL,
    [Surface_Long]      NUMERIC (38, 8)  NULL,
    [Bottomhole_Long]   NUMERIC (38, 8)  NULL,
    [Region]            NVARCHAR (255)   NULL,
    [State]             NVARCHAR (255)   NULL,
    [County]            NVARCHAR (255)   NULL,
    [Operator]          NVARCHAR (255)   NULL,
    [Well_Name]         NVARCHAR (255)   NULL,
    [Well_API]          NUMERIC (38, 8)  NULL,
    [Frac_Start_Date]   DATETIME2 (7)    NULL,
    [Frac_End_Date]     DATETIME2 (7)    NULL,
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
    CONSTRAINT [R666_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g629_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE NONCLUSTERED INDEX [I4365Well_API_TX]
    ON [dbo].[UPS_FRAC_SCHED_STICKS]([Well_API_TXT] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S629_idx]
    ON [dbo].[UPS_FRAC_SCHED_STICKS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -93.3509000018, XMIN = -93.9637999982, YMAX = 32.3841999993, YMIN = -93.9637999982)
          );

