CREATE TABLE [dbo].[GL_PROJ_CONS_ACCTG_PER] (
    [GL_PROJ_CONS_ACCTG_PER_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                     VARCHAR (255)   NULL,
    [ACCTG_PERIODS]             DATETIME        NULL,
    [CF_STAT1_AMTS]             NUMERIC (19, 2) NULL,
    [CF_STAT1_QTY1S]            NUMERIC (19, 2) NULL,
    [CF_STAT1_QTY2S]            NUMERIC (19, 2) NULL,
    [CF_STAT2_AMTS]             NUMERIC (19, 2) NULL,
    [CF_STAT2_QTY1S]            NUMERIC (19, 2) NULL,
    [CF_STAT2_QTY2S]            NUMERIC (19, 2) NULL,
    [GL_AMTS]                   NUMERIC (19, 2) NULL,
    [GL_QTY1S]                  NUMERIC (19, 2) NULL,
    [GL_QTY2S]                  NUMERIC (19, 2) NULL,
    [GL_STAT1_AMTS]             NUMERIC (19, 2) NULL,
    [GL_STAT1_QTY1S]            NUMERIC (19, 2) NULL,
    [GL_STAT1_QTY2S]            NUMERIC (19, 2) NULL,
    [GL_STAT2_AMTS]             NUMERIC (19, 2) NULL,
    [GL_STAT2_QTY1S]            NUMERIC (19, 2) NULL,
    [GL_STAT2_QTY2S]            NUMERIC (19, 2) NULL,
    [OCCUR_AMTS]                NUMERIC (19, 2) NULL,
    [OCCUR_QTY1S]               NUMERIC (19, 2) NULL,
    [OCCUR_QTY2S]               NUMERIC (19, 2) NULL,
    [OCCUR_STAT1_AMTS]          NUMERIC (19, 2) NULL,
    [OCCUR_STAT1_QTY1S]         NUMERIC (19, 2) NULL,
    [OCCUR_STAT1_QTY2S]         NUMERIC (19, 2) NULL,
    [OCCUR_STAT2_AMTS]          NUMERIC (19, 2) NULL,
    [OCCUR_STAT2_QTY1S]         NUMERIC (19, 2) NULL,
    [OCCUR_STAT2_QTY2S]         NUMERIC (19, 2) NULL,
    [PL_AMTS]                   NUMERIC (19, 2) NULL,
    [REVAL_AMTS]                NUMERIC (19, 2) NULL,
    [time_stamp]                DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([GL_PROJ_CONS_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GL_PROJ_C_u2_id_86742]
    ON [dbo].[GL_PROJ_CONS_ACCTG_PER]([u2_id] ASC);

