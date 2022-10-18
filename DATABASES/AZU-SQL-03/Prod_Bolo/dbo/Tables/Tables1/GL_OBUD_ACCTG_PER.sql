CREATE TABLE [dbo].[GL_OBUD_ACCTG_PER] (
    [GL_OBUD_ACCTG_PER_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                VARCHAR (255)   NULL,
    [ACCTG_PERIODS]        DATETIME        NULL,
    [AMTS]                 NUMERIC (19, 2) NULL,
    [CC_ALLOC_DATES]       DATETIME        NULL,
    [JIB_DECK_ID]          VARCHAR (10)    NULL,
    [JIB_SESSION]          VARCHAR (7)     NULL,
    [OBD_CC_ALLOC_IDS]     VARCHAR (15)    NULL,
    [QTY1S]                NUMERIC (19, 2) NULL,
    [QTY2S]                NUMERIC (19, 2) NULL,
    [STAT1_AMTS]           NUMERIC (19, 2) NULL,
    [STAT1_QTY1S]          NUMERIC (19, 2) NULL,
    [STAT1_QTY2S]          NUMERIC (19, 2) NULL,
    [STAT2_AMTS]           NUMERIC (19, 2) NULL,
    [STAT2_QTY1S]          NUMERIC (19, 2) NULL,
    [STAT2_QTY2S]          NUMERIC (19, 2) NULL,
    [time_stamp]           DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([GL_OBUD_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GL_OBUD_ACCTG_PER_u2_id_in]
    ON [dbo].[GL_OBUD_ACCTG_PER]([u2_id] ASC);

