﻿CREATE TABLE [dbo].[UPR_OWNER_REMARK] (
    [UPR_OWNER_REMARK_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [REMARKS]             VARCHAR (100) NULL,
    [REMARK_CODES]        VARCHAR (6)   NULL,
    [REMARK_DATES]        DATETIME      NULL,
    [REMARK_USERS]        VARCHAR (13)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([UPR_OWNER_REMARK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [UPR_OWNER_REMARK_u2_id_in]
    ON [dbo].[UPR_OWNER_REMARK]([u2_id] ASC);
