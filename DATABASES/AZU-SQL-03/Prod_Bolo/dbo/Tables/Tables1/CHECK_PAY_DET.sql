CREATE TABLE [dbo].[CHECK_PAY_DET] (
    [CHECK_PAY_DET_ID] VARCHAR (255)   NOT NULL,
    [u2_id]            VARCHAR (255)   NULL,
    [COST_CENTERS]     VARCHAR (12)    NULL,
    [DETAIL_AMT]       NUMERIC (19, 2) NULL,
    [PAY_DETAIL_INDEX] VARCHAR (32)    NULL,
    [PROPERTIES]       VARCHAR (12)    NULL,
    [time_stamp]       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CHECK_PAY_DET_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CHECK_PAY_DET_u2_id_in]
    ON [dbo].[CHECK_PAY_DET]([u2_id] ASC);

