﻿CREATE TABLE [dbo].[FIN_RPT_MAP_COORDINATE] (
    [FIN_RPT_MAP_COORDINATE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                     VARCHAR (255) NULL,
    [COORDS]                    VARCHAR (11)  NULL,
    [time_stamp]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([FIN_RPT_MAP_COORDINATE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FIN_RPT_M_u2_id_68911]
    ON [dbo].[FIN_RPT_MAP_COORDINATE]([u2_id] ASC);
