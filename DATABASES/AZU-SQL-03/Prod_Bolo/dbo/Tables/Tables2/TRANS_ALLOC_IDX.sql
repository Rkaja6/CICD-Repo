﻿CREATE TABLE [dbo].[TRANS_ALLOC_IDX] (
    [TRANS_ALLOC_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [ALLOC_TRANS_INDEX]  VARCHAR (9)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([TRANS_ALLOC_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_ALLOC_IDX_u2_id_in]
    ON [dbo].[TRANS_ALLOC_IDX]([u2_id] ASC);

