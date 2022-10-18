CREATE TABLE [dbo].[AT_DDA_RATE_CALC_DATE] (
    [AT_DDA_RATE_CALC_DATE_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                    VARCHAR (255)   NULL,
    [CALC_DATES]               DATETIME        NULL,
    [DDA_RATE]                 NUMERIC (19, 6) NULL,
    [EOQ_PROD_BOE]             NUMERIC (19, 2) NULL,
    [EOY_RESERVES_BOE]         NUMERIC (19, 2) NULL,
    [EOY_REVISED_RATE]         NUMERIC (19, 6) NULL,
    [MO_PROD_BOE]              NUMERIC (19, 2) NULL,
    [QTD_PROD_BOE]             NUMERIC (19, 2) NULL,
    [RESERVES_BOE]             NUMERIC (19, 2) NULL,
    [YTD_PROD_BOE]             NUMERIC (19, 2) NULL,
    [time_stamp]               DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([AT_DDA_RATE_CALC_DATE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_DDA_RATE_CALC_DATE_u2_id_in]
    ON [dbo].[AT_DDA_RATE_CALC_DATE]([u2_id] ASC);

