CREATE TABLE [dbo].[STD_JE_INFL] (
    [STD_JE_INFL_ID] VARCHAR (255)   NOT NULL,
    [u2_id]          VARCHAR (255)   NULL,
    [INFL_DATE]      DATETIME        NULL,
    [INFL_RATE]      NUMERIC (19, 4) NULL,
    [INFL_USER]      VARCHAR (9)     NULL,
    [time_stamp]     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([STD_JE_INFL_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STD_JE_INFL_u2_id_in]
    ON [dbo].[STD_JE_INFL]([u2_id] ASC);

