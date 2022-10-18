CREATE TABLE [dbo].[GL_BUD_PROJ_CONS_AMT] (
    [subValueId]                    VARCHAR (255)   NOT NULL,
    [GL_BUD_PROJ_CONS_ACCTG_PER_ID] VARCHAR (255)   NULL,
    [GL_AMTS]                       NUMERIC (19, 2) NULL,
    [GL_QTY1S]                      NUMERIC (19, 2) NULL,
    [GL_QTY2S]                      NUMERIC (19, 2) NULL,
    [GL_STAT1_AMTS]                 NUMERIC (19, 2) NULL,
    [GL_STAT1_QTY1S]                NUMERIC (19, 2) NULL,
    [GL_STAT1_QTY2S]                NUMERIC (19, 2) NULL,
    [GL_STAT2_AMTS]                 NUMERIC (19, 2) NULL,
    [GL_STAT2_QTY1S]                NUMERIC (19, 2) NULL,
    [GL_STAT2_QTY2S]                NUMERIC (19, 2) NULL,
    [time_stamp]                    DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GL_BUD_PR_GL_BUD_PR_91392]
    ON [dbo].[GL_BUD_PROJ_CONS_AMT]([GL_BUD_PROJ_CONS_ACCTG_PER_ID] ASC);

