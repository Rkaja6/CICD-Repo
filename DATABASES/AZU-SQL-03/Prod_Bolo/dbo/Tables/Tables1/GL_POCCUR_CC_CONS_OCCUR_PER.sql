CREATE TABLE [dbo].[GL_POCCUR_CC_CONS_OCCUR_PER] (
    [subValueId]                     VARCHAR (255)   NOT NULL,
    [GL_POCCUR_CC_CONS_ACCTG_PER_ID] VARCHAR (255)   NULL,
    [AMTS]                           NUMERIC (19, 2) NULL,
    [OCCUR_PERIODS]                  DATETIME        NULL,
    [QTY1S]                          NUMERIC (19, 2) NULL,
    [QTY2S]                          NUMERIC (19, 2) NULL,
    [REVAL_AMTS]                     NUMERIC (19, 2) NULL,
    [STAT1_AMTS]                     NUMERIC (19, 2) NULL,
    [STAT1_QTY1S]                    NUMERIC (19, 2) NULL,
    [STAT1_QTY2S]                    NUMERIC (19, 2) NULL,
    [STAT2_AMTS]                     NUMERIC (19, 2) NULL,
    [STAT2_QTY1S]                    NUMERIC (19, 2) NULL,
    [STAT2_QTY2S]                    NUMERIC (19, 2) NULL,
    [time_stamp]                     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GL_POCCUR_GL_POCCUR_41447]
    ON [dbo].[GL_POCCUR_CC_CONS_OCCUR_PER]([GL_POCCUR_CC_CONS_ACCTG_PER_ID] ASC);

