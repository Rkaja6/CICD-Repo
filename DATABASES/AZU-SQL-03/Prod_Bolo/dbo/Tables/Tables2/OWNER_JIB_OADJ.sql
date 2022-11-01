﻿CREATE TABLE [dbo].[OWNER_JIB_OADJ] (
    [OWNER_JIB_OADJ_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [OADJ_TRANS_INDEX]  VARCHAR (5)   NULL,
    [OADJ_TYPES]        VARCHAR (5)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OWNER_JIB_OADJ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_JIB_OADJ_u2_id_in]
    ON [dbo].[OWNER_JIB_OADJ]([u2_id] ASC);
