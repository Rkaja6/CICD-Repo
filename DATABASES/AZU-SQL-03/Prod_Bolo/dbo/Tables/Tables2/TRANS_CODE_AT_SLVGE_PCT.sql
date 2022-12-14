CREATE TABLE [dbo].[TRANS_CODE_AT_SLVGE_PCT] (
    [subValueId]       VARCHAR (255)   NOT NULL,
    [TRANS_CODE_AT_ID] VARCHAR (255)   NULL,
    [AT_SALVAGE_PCTS]  NUMERIC (19, 2) NULL,
    [time_stamp]       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRANS_COD_TRANS_COD_86498]
    ON [dbo].[TRANS_CODE_AT_SLVGE_PCT]([TRANS_CODE_AT_ID] ASC);

