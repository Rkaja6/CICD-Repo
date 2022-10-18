﻿CREATE TABLE [dbo].[WEL_ENV_MBSSR_PNT] (
    [OBJECTID]          INT              NOT NULL,
    [LAYER]             NVARCHAR (21)    NULL,
    [MAP_NAME]          NVARCHAR (46)    NULL,
    [api_uwi]           NVARCHAR (80)    NULL,
    [api14]             NVARCHAR (80)    NULL,
    [api14_unfm]        NVARCHAR (80)    NULL,
    [wellID]            NVARCHAR (80)    NULL,
    [completeID]        NVARCHAR (80)    NULL,
    [wellname]          NVARCHAR (80)    NULL,
    [country]           NVARCHAR (80)    NULL,
    [state]             NVARCHAR (80)    NULL,
    [county]            NVARCHAR (80)    NULL,
    [envoperatr]        NVARCHAR (80)    NULL,
    [envticker]         NVARCHAR (80)    NULL,
    [servprvdr]         NVARCHAR (80)    NULL,
    [prdwelltyp]        NVARCHAR (80)    NULL,
    [welltype]          NVARCHAR (80)    NULL,
    [prdmethod]         NVARCHAR (80)    NULL,
    [env_region]        NVARCHAR (80)    NULL,
    [env_basin]         NVARCHAR (80)    NULL,
    [env_play]          NVARCHAR (80)    NULL,
    [envsubplay]        NVARCHAR (80)    NULL,
    [envintrval]        NVARCHAR (80)    NULL,
    [wellstatus]        NVARCHAR (80)    NULL,
    [trajectory]        NVARCHAR (80)    NULL,
    [formation]         NVARCHAR (80)    NULL,
    [frstprddte]        NVARCHAR (80)    NULL,
    [latitude]          NVARCHAR (80)    NULL,
    [longitude]         NVARCHAR (80)    NULL,
    [bh_lat]            NVARCHAR (80)    NULL,
    [bh_long]           NVARCHAR (80)    NULL,
    [TVD]               NVARCHAR (80)    NULL,
    [MD]                NVARCHAR (80)    NULL,
    [district]          NVARCHAR (80)    NULL,
    [field]             NVARCHAR (80)    NULL,
    [abstract]          NVARCHAR (80)    NULL,
    [section]           NVARCHAR (80)    NULL,
    [township]          NVARCHAR (80)    NULL,
    [range]             NVARCHAR (80)    NULL,
    [vintage]           NVARCHAR (80)    NULL,
    [envelev_kb]        NVARCHAR (80)    NULL,
    [envelev_GL]        NVARCHAR (80)    NULL,
    [coordsrce]         NVARCHAR (80)    NULL,
    [permitdate]        NVARCHAR (80)    NULL,
    [spuddate]          NVARCHAR (80)    NULL,
    [completdte]        NVARCHAR (80)    NULL,
    [fractype]          NVARCHAR (80)    NULL,
    [fluidtype]         NVARCHAR (80)    NULL,
    [spdtorelse]        NVARCHAR (80)    NULL,
    [spudtocomp]        NVARCHAR (80)    NULL,
    [spudtosale]        NVARCHAR (80)    NULL,
    [upperperf]         NVARCHAR (80)    NULL,
    [lowerperf]         NVARCHAR (80)    NULL,
    [latlength]         NVARCHAR (80)    NULL,
    [fracstages]        NVARCHAR (80)    NULL,
    [propbrand]         NVARCHAR (87)    NULL,
    [propload]          NVARCHAR (80)    NULL,
    [proptype]          NVARCHAR (80)    NULL,
    [propinten]         NVARCHAR (80)    NULL,
    [proppant]          NVARCHAR (80)    NULL,
    [fluid]             NVARCHAR (80)    NULL,
    [fluidinten]        NVARCHAR (80)    NULL,
    [testdate]          NVARCHAR (80)    NULL,
    [oiltestrte]        NVARCHAR (80)    NULL,
    [gastestrte]        NVARCHAR (80)    NULL,
    [wtrtestrte]        NVARCHAR (80)    NULL,
    [first3gas]         NVARCHAR (80)    NULL,
    [first3oil]         NVARCHAR (80)    NULL,
    [first3wtr]         NVARCHAR (80)    NULL,
    [first6gas]         NVARCHAR (80)    NULL,
    [first6oil]         NVARCHAR (80)    NULL,
    [first6wtr]         NVARCHAR (80)    NULL,
    [cumgas]            NVARCHAR (80)    NULL,
    [cumoil]            NVARCHAR (80)    NULL,
    [cumwater]          NVARCHAR (80)    NULL,
    [totprdmnth]        NVARCHAR (80)    NULL,
    [cumwhliq]          NVARCHAR (80)    NULL,
    [avghzsame]         NVARCHAR (80)    NULL,
    [avgvtsame]         NVARCHAR (80)    NULL,
    [closhzsame]        NVARCHAR (80)    NULL,
    [closvtsame]        NVARCHAR (80)    NULL,
    [avghzany]          NVARCHAR (80)    NULL,
    [avgvtany]          NVARCHAR (80)    NULL,
    [closhzany]         NVARCHAR (80)    NULL,
    [closvtany]         NVARCHAR (80)    NULL,
    [wellcost]          NVARCHAR (80)    NULL,
    [welcosthst]        NVARCHAR (80)    NULL,
    [npv55_3]           NVARCHAR (80)    NULL,
    [npvhst55_3]        NVARCHAR (80)    NULL,
    [irr55_3]           NVARCHAR (80)    NULL,
    [irrhst55_3]        NVARCHAR (80)    NULL,
    [eur360mboe]        NVARCHAR (80)    NULL,
    [eur360bcfe]        NVARCHAR (80)    NULL,
    [eur360mbbl]        NVARCHAR (80)    NULL,
    [eur360bcf]         NVARCHAR (80)    NULL,
    [be20_1_bbl]        NVARCHAR (80)    NULL,
    [be20_1hbbl]        NVARCHAR (80)    NULL,
    [be20_1_mcf]        NVARCHAR (80)    NULL,
    [be20_1hmcf]        NVARCHAR (80)    NULL,
    [spacingany]        NVARCHAR (80)    NULL,
    [spacngsame]        NVARCHAR (80)    NULL,
    [geomWKT]           NVARCHAR (80)    NULL,
    [POINT_SYMB]        NVARCHAR (3)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R688_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g651_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S651_idx]
    ON [dbo].[WEL_ENV_MBSSR_PNT] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 44589775.7503895, XMIN = -21940362.55806, YMAX = 33265069.1542248, YMIN = -33265069.1542248)
          );

