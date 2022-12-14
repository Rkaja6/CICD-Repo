CREATE TABLE [Upstream].[WellHeader_AllSources] (
    [API14]                       VARCHAR (20)    NOT NULL,
    [RecordSource]                VARCHAR (50)    NOT NULL,
    [LoadDate]                    DATETIME2 (7)   NOT NULL,
    [Lease_Name]                  VARCHAR (100)   NULL,
    [Well_Number]                 VARCHAR (50)    NULL,
    [Operator]                    VARCHAR (100)   NULL,
    [Field]                       VARCHAR (100)   NULL,
    [Primary_Product]             VARCHAR (50)    NULL,
    [Hole_Direction]              VARCHAR (12)    NULL,
    [Status]                      VARCHAR (60)    NULL,
    [Activity]                    VARCHAR (60)    NULL,
    [Classification]              VARCHAR (60)    NULL,
    [Surface_Hole_Latitude]       DECIMAL (32, 9) NULL,
    [Surface_Hole_Longitude]      DECIMAL (32, 9) NULL,
    [Surface_Hole_Datum]          VARCHAR (10)    NULL,
    [Bottom_Hole_Latitude]        DECIMAL (32, 9) NULL,
    [Bottom_Hole_Longitude]       DECIMAL (32, 9) NULL,
    [Bottom_Hole_Datum]           VARCHAR (10)    NULL,
    [State]                       VARCHAR (60)    NULL,
    [County]                      VARCHAR (60)    NULL,
    [Section]                     VARCHAR (20)    NULL,
    [Township]                    VARCHAR (50)    NULL,
    [Range]                       VARCHAR (50)    NULL,
    [Abstract]                    VARCHAR (20)    NULL,
    [Survey]                      VARCHAR (60)    NULL,
    [Block]                       VARCHAR (20)    NULL,
    [Quarter_Quarter]             VARCHAR (20)    NULL,
    [Footage_North_South]         VARCHAR (60)    NULL,
    [Footage_East_West]           VARCHAR (60)    NULL,
    [Footage_Reference_Name]      VARCHAR (60)    NULL,
    [Basin]                       VARCHAR (60)    NULL,
    [Geologic_Province]           VARCHAR (60)    NULL,
    [Formation_Projected]         VARCHAR (200)   NULL,
    [Formation_TD]                VARCHAR (200)   NULL,
    [Formation_Producing_Top]     VARCHAR (200)   NULL,
    [Formation_Producing_Base]    VARCHAR (200)   NULL,
    [Formation_80_Degree_Heel_Pt] VARCHAR (200)   NULL,
    [Play]                        VARCHAR (60)    NULL,
    [Subplay]                     VARCHAR (50)    NULL,
    [Play_Type]                   VARCHAR (30)    NULL,
    [Depth_Total]                 DECIMAL (32, 5) NULL,
    [Depth_Kickoff_Point]         DECIMAL (32, 5) NULL,
    [Depth_True_Vertical]         DECIMAL (32, 5) NULL,
    [Depth_Plug_Back]             DECIMAL (32, 5) NULL,
    [Depth_Total_Driller]         DECIMAL (32, 5) NULL,
    [Depth_Total_Logger]          DECIMAL (32, 5) NULL,
    [Depth_Total_Projected]       DECIMAL (32, 5) NULL,
    [Depth_Whipstock]             DECIMAL (32, 5) NULL,
    [Depth_Upper_Perforation]     DECIMAL (32, 5) NULL,
    [Depth_Lower_Perforation]     DECIMAL (32, 5) NULL,
    [Length_Perforated_Interval]  DECIMAL (32, 5) NULL,
    [Length_Lateral]              DECIMAL (32, 5) NULL,
    [Length_Horizontal]           DECIMAL (32, 5) NULL,
    [Elevation_Ground]            DECIMAL (32, 5) NULL,
    [Elevation_Casing_Flange]     DECIMAL (32, 5) NULL,
    [Elevation_Derrick_Floor]     DECIMAL (32, 5) NULL,
    [Elevation_Kelly_Bushing]     DECIMAL (32, 5) NULL,
    [Elevation_Rotary_Table]      DECIMAL (32, 5) NULL,
    [Date_Permit]                 DATE            NULL,
    [Date_Rig_Onsite]             DATE            NULL,
    [Date_Spud]                   DATE            NULL,
    [Date_Completion]             DATE            NULL,
    [Date_Rig_Release]            DATE            NULL,
    [Date_Abandonment]            DATE            NULL,
    [Date_First_Production]       DATE            NULL,
    [Date_Last_Activity]          DATE            NULL,
    [Midpoint_Latitude]           NUMERIC (32, 9) NULL,
    [Midpoint_Longitude]          NUMERIC (32, 9) NULL,
    CONSTRAINT [PK_WellHeader_AllSources] PRIMARY KEY NONCLUSTERED ([API14] ASC, [RecordSource] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);


GO
CREATE NONCLUSTERED INDEX [nci_wi_WellHeader_AllSources_C279CF89BCF7166102BD148283A7DAEE]
    ON [Upstream].[WellHeader_AllSources]([Classification] ASC);


GO
CREATE NONCLUSTERED INDEX [nci_wi_WellHeader_AllSources_0F321F9986A9C35FC5BBA0B61EF01283]
    ON [Upstream].[WellHeader_AllSources]([County] ASC, [State] ASC);

