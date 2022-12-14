CREATE TABLE [dbo].[GL_BUD_ACCTG_PER] (
    [GL_BUD_ACCTG_PER_ID] VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [ACCTG_PERIODS]       DATETIME        NULL,
    [AMTS]                NUMERIC (19, 2) NULL,
    [QTY1S]               NUMERIC (19, 2) NULL,
    [QTY2S]               NUMERIC (19, 2) NULL,
    [STAT1_AMTS]          NUMERIC (19, 2) NULL,
    [STAT1_QTY1S]         NUMERIC (19, 2) NULL,
    [STAT1_QTY2S]         NUMERIC (19, 2) NULL,
    [STAT2_AMTS]          NUMERIC (19, 2) NULL,
    [STAT2_QTY1S]         NUMERIC (19, 2) NULL,
    [STAT2_QTY2S]         NUMERIC (19, 2) NULL,
    [time_stamp]          DATETIME        NULL
);


GO
CREATE NONCLUSTERED INDEX [GL_BUD_ACCTG_PER_u2_id_in]
    ON [dbo].[GL_BUD_ACCTG_PER]([u2_id] ASC);

