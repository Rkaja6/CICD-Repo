﻿CREATE TABLE [dbo].[BMP_COUNTIES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (32)    NULL,
    [STATE_NAME]        NVARCHAR (35)    NULL,
    [STATE_FIPS]        NVARCHAR (2)     NULL,
    [CNTY_FIPS]         NVARCHAR (3)     NULL,
    [FIPS]              NVARCHAR (5)     NULL,
    [POPULATION]        INT              NULL,
    [POP_SQMI]          NUMERIC (38, 8)  NULL,
    [POP2010]           INT              NULL,
    [POP10_SQMI]        NUMERIC (38, 8)  NULL,
    [WHITE]             INT              NULL,
    [BLACK]             INT              NULL,
    [AMERI_ES]          INT              NULL,
    [ASIAN]             INT              NULL,
    [HAWN_PI]           INT              NULL,
    [HISPANIC]          INT              NULL,
    [OTHER]             INT              NULL,
    [MULT_RACE]         INT              NULL,
    [MALES]             INT              NULL,
    [FEMALES]           INT              NULL,
    [AGE_UNDER5]        INT              NULL,
    [AGE_5_9]           INT              NULL,
    [AGE_10_14]         INT              NULL,
    [AGE_15_19]         INT              NULL,
    [AGE_20_24]         INT              NULL,
    [AGE_25_34]         INT              NULL,
    [AGE_35_44]         INT              NULL,
    [AGE_45_54]         INT              NULL,
    [AGE_55_64]         INT              NULL,
    [AGE_65_74]         INT              NULL,
    [AGE_75_84]         INT              NULL,
    [AGE_85_UP]         INT              NULL,
    [MED_AGE]           NUMERIC (38, 8)  NULL,
    [MED_AGE_M]         NUMERIC (38, 8)  NULL,
    [MED_AGE_F]         NUMERIC (38, 8)  NULL,
    [HOUSEHOLDS]        INT              NULL,
    [AVE_HH_SZ]         NUMERIC (38, 8)  NULL,
    [HSEHLD_1_M]        INT              NULL,
    [HSEHLD_1_F]        INT              NULL,
    [MARHH_CHD]         INT              NULL,
    [MARHH_NO_C]        INT              NULL,
    [MHH_CHILD]         INT              NULL,
    [FHH_CHILD]         INT              NULL,
    [FAMILIES]          INT              NULL,
    [AVE_FAM_SZ]        NUMERIC (38, 8)  NULL,
    [HSE_UNITS]         INT              NULL,
    [VACANT]            INT              NULL,
    [OWNER_OCC]         INT              NULL,
    [RENTER_OCC]        INT              NULL,
    [NO_FARMS12]        NUMERIC (38, 8)  NULL,
    [AVE_SIZE12]        NUMERIC (38, 8)  NULL,
    [CROP_ACR12]        NUMERIC (38, 8)  NULL,
    [AVE_SALE12]        NUMERIC (38, 8)  NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R75_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g65_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S65_idx]
    ON [dbo].[BMP_COUNTIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20012847.1794, XMIN = -19942590.6658, YMAX = 11537127.3335, YMIN = 2023652.7986),
            CELLS_PER_OBJECT = 16
          );

