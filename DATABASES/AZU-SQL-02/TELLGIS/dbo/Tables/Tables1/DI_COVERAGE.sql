CREATE TABLE [dbo].[DI_COVERAGE] (
    [OBJECTID]                  INT              NOT NULL,
    [state]                     NVARCHAR (5)     NULL,
    [countyName]                NVARCHAR (63)    NOT NULL,
    [APIst]                     NVARCHAR (50)    NULL,
    [APIcty]                    NVARCHAR (50)    NULL,
    [FIPS_STATE]                NVARCHAR (10)    NULL,
    [FIPS_COUNTY]               NVARCHAR (10)    NULL,
    [StateID]                   INT              NULL,
    [countyID]                  INT              NULL,
    [Well_Count]                INT              NULL,
    [Well_No_Geom_Count]        INT              NULL,
    [WellBHL_Count]             INT              NULL,
    [WellBHL_No_Geom_Count]     INT              NULL,
    [Completion_Count]          INT              NULL,
    [Completion_No_Geom_Count]  INT              NULL,
    [Permit_Count]              INT              NULL,
    [Permit_No_Geom_Count]      INT              NULL,
    [Plugging_Count]            INT              NULL,
    [Plugging_No_Geom_Count]    INT              NULL,
    [PrePermit_Count]           INT              NULL,
    [PrePermit_No_Geom_Count]   INT              NULL,
    [Production_Count]          INT              NULL,
    [Production_No_Geom_Count]  INT              NULL,
    [Lease_Count]               INT              NULL,
    [Lease_No_Geom_Count]       INT              NULL,
    [Landtrac_Count]            INT              NULL,
    [TX_Producing_Unit_Count]   INT              NULL,
    [TX_Pipeline_Count]         INT              NULL,
    [Landtrac_Release]          NVARCHAR (50)    NULL,
    [Fee_Lease_Release]         NVARCHAR (50)    NULL,
    [TX_Producing_Unit_Release] NVARCHAR (50)    NULL,
    [Nad27]                     NVARCHAR (50)    NULL,
    [Nad83]                     NVARCHAR (50)    NULL,
    [UTMZone]                   NVARCHAR (50)    NULL,
    [Shape]                     [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]         VARBINARY (MAX)  NULL,
    CONSTRAINT [R488_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g451_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S451_idx]
    ON [dbo].[DI_COVERAGE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 19815124.5066, XMIN = -19851964.5746, YMAX = 11753293.2674, YMIN = 2144423.9259),
            CELLS_PER_OBJECT = 16
          );

