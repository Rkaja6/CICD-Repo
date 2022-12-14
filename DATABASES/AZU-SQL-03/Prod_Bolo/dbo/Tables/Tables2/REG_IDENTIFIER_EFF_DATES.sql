CREATE TABLE [dbo].[REG_IDENTIFIER_EFF_DATES] (
    [REG_IDENTIFIER_EFF_DATES_ID] VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [EFF_DATES]                   DATETIME      NULL,
    [EXP_DATES]                   DATETIME      NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([REG_IDENTIFIER_EFF_DATES_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [REG_IDENT_u2_id_59823]
    ON [dbo].[REG_IDENTIFIER_EFF_DATES]([u2_id] ASC);

