CREATE TABLE [dbo].[OWNER_JIB_RPT_CURRS] (
    [OWNER_JIB_RPT_CURRS_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                  VARCHAR (255)   NULL,
    [RPT_AMT]                NUMERIC (19, 2) NULL,
    [TARGET_CURRENCIES]      VARCHAR (4)     NULL,
    [time_stamp]             DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OWNER_JIB_RPT_CURRS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OWNER_JIB_RPT_CURRS_u2_id_in]
    ON [dbo].[OWNER_JIB_RPT_CURRS]([u2_id] ASC);

