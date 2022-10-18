CREATE TABLE [dbo].[GRAVITY_ADJ_CODE_ADJ] (
    [GRAVITY_ADJ_CODE_ADJ_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                   VARCHAR (255)   NULL,
    [ADJ_AMTS]                NUMERIC (19, 3) NULL,
    [FROM_GRAVITY]            NUMERIC (9, 1)  NULL,
    [INCREMENTS]              NUMERIC (9, 1)  NULL,
    [PLUS_MINUS]              VARCHAR (3)     NULL,
    [TO_GRAVITY]              NUMERIC (9, 1)  NULL,
    [time_stamp]              DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([GRAVITY_ADJ_CODE_ADJ_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GRAVITY_ADJ_CODE_ADJ_u2_id_in]
    ON [dbo].[GRAVITY_ADJ_CODE_ADJ]([u2_id] ASC);

