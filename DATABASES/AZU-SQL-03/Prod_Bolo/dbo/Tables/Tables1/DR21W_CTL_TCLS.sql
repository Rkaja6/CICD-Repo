﻿CREATE TABLE [dbo].[DR21W_CTL_TCLS] (
    [DR21W_CTL_TCLS_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [STRIPPER_TCLASS]   VARCHAR (8)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([DR21W_CTL_TCLS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DR21W_CTL_TCLS_u2_id_in]
    ON [dbo].[DR21W_CTL_TCLS]([u2_id] ASC);

