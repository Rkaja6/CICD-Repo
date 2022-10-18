﻿CREATE TABLE [dbo].[WELL_DOWN_DUP_WELLS] (
    [WELL_DOWN_DUP_WELLS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [DUP_WELLS]              VARCHAR (10)  NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([WELL_DOWN_DUP_WELLS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_DOWN_DUP_WELLS_u2_id_in]
    ON [dbo].[WELL_DOWN_DUP_WELLS]([u2_id] ASC);

