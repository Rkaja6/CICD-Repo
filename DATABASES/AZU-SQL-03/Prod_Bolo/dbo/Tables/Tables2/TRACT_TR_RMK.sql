CREATE TABLE [dbo].[TRACT_TR_RMK] (
    [TRACT_TR_RMK_ID] VARCHAR (255)  NOT NULL,
    [u2_id]           VARCHAR (255)  NULL,
    [REMARK_CODES]    VARCHAR (9)    NULL,
    [REMARK_DATES]    DATETIME       NULL,
    [TRACT_REMARKS]   VARCHAR (1231) NULL,
    [time_stamp]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([TRACT_TR_RMK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRACT_TR_RMK_u2_id_in]
    ON [dbo].[TRACT_TR_RMK]([u2_id] ASC);

