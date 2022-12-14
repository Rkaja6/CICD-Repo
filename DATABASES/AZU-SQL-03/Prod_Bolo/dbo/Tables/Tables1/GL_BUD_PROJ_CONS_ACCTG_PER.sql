CREATE TABLE [dbo].[GL_BUD_PROJ_CONS_ACCTG_PER] (
    [GL_BUD_PROJ_CONS_ACCTG_PER_ID] VARCHAR (255) NOT NULL,
    [u2_id]                         VARCHAR (255) NULL,
    [ACCTG_PERIODS]                 DATETIME      NULL,
    [time_stamp]                    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GL_BUD_PROJ_CONS_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GL_BUD_PR_u2_id_49191]
    ON [dbo].[GL_BUD_PROJ_CONS_ACCTG_PER]([u2_id] ASC);

