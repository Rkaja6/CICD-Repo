﻿CREATE TABLE [dbo].[TRANS_CODE_AT] (
    [TRANS_CODE_AT_ID]      VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [AT_IN_SERVICE_PERIODS] DATETIME      NULL,
    [AT_PERSPECTIVES]       VARCHAR (5)   NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([TRANS_CODE_AT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_CODE_AT_u2_id_in]
    ON [dbo].[TRANS_CODE_AT]([u2_id] ASC);

