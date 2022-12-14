CREATE TABLE [dbo].[TRACT_COT] (
    [TRACT_COT_ID]    VARCHAR (255)  NOT NULL,
    [u2_id]           VARCHAR (255)  NULL,
    [COT_DATES]       VARCHAR (8)    NULL,
    [COT_DESCS]       VARCHAR (1622) NULL,
    [COT_INSTR_TYPES] VARCHAR (5)    NULL,
    [COT_NAMES]       VARCHAR (8)    NULL,
    [time_stamp]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([TRACT_COT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRACT_COT_u2_id_in]
    ON [dbo].[TRACT_COT]([u2_id] ASC);

