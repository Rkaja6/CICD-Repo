﻿CREATE TABLE [dbo].[AT_TRANS_FROM_ALLOC_TRANS_IDX] (
    [AT_TRANS_FROM_ALLOC_TRANS_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]                            VARCHAR (255) NULL,
    [FROM_ALLOC_TRANS_INDEX]           VARCHAR (8)   NULL,
    [time_stamp]                       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_TRANS_FROM_ALLOC_TRANS_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_TRANS__u2_id_22697]
    ON [dbo].[AT_TRANS_FROM_ALLOC_TRANS_IDX]([u2_id] ASC);

