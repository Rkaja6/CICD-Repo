CREATE TABLE [dbo].[AT_INV_DET_BALFWD_TRAN] (
    [AT_INV_DET_BALFWD_TRAN_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                     VARCHAR (255)   NULL,
    [AMT]                       NUMERIC (19, 2) NULL,
    [QTY1]                      NUMERIC (19, 2) NULL,
    [QTY2]                      NUMERIC (19, 2) NULL,
    [time_stamp]                DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AT_INV_DET_BALFWD_TRAN_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_INV_DE_u2_id_13883]
    ON [dbo].[AT_INV_DET_BALFWD_TRAN]([u2_id] ASC);

