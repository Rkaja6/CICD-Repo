﻿CREATE TABLE [dbo].[CHECK_MAN_CHECK] (
    [CHECK_MAN_CHECK_ID] VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [DETAIL_PAY_AMTS]    NUMERIC (19, 2) NULL,
    [REFUND_INDEX]       VARCHAR (15)    NULL,
    [SOURCE_DOCS]        VARCHAR (30)    NULL,
    [TRANS_INDEX]        VARCHAR (9)     NULL,
    [TRANS_TYPES]        VARCHAR (4)     NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CHECK_MAN_CHECK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CHECK_MAN_CHECK_u2_id_in]
    ON [dbo].[CHECK_MAN_CHECK]([u2_id] ASC);
