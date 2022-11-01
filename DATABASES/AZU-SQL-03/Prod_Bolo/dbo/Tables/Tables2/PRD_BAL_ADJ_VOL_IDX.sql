﻿CREATE TABLE [dbo].[PRD_BAL_ADJ_VOL_IDX] (
    [PRD_BAL_ADJ_VOL_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [OWNER_VOL_INDEX]        VARCHAR (20)  NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRD_BAL_ADJ_VOL_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRD_BAL_ADJ_VOL_IDX_u2_id_in]
    ON [dbo].[PRD_BAL_ADJ_VOL_IDX]([u2_id] ASC);
