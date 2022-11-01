﻿CREATE TABLE [dbo].[RESERVE_TRANS_CN_TRANS_IDX] (
    [RESERVE_TRANS_CN_TRANS_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                         VARCHAR (255) NULL,
    [CN_TRANS_INDEX]                VARCHAR (9)   NULL,
    [time_stamp]                    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RESERVE_TRANS_CN_TRANS_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RESERVE_T_u2_id_93477]
    ON [dbo].[RESERVE_TRANS_CN_TRANS_IDX]([u2_id] ASC);
