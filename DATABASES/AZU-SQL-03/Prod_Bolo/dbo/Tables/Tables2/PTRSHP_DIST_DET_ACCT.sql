CREATE TABLE [dbo].[PTRSHP_DIST_DET_ACCT] (
    [PTRSHP_DIST_DET_ACCT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [ACCTS]                   VARCHAR (10)    NULL,
    [AMTS]                    NUMERIC (19, 2) NULL,
    [QTY1S]                   NUMERIC (19, 2) NULL,
    [QTY2S]                   NUMERIC (19, 2) NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PTRSHP_DIST_DET_ACCT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PTRSHP_DIST_DET_ACCT_u2_id_in]
    ON [dbo].[PTRSHP_DIST_DET_ACCT]([u2_id] ASC);

