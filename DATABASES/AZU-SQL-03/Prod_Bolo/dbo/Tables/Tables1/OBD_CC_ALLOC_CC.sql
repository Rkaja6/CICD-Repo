CREATE TABLE [dbo].[OBD_CC_ALLOC_CC] (
    [OBD_CC_ALLOC_CC_ID] VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [ACCTS]              VARCHAR (12)    NULL,
    [COST_CENTERS]       VARCHAR (8)     NULL,
    [PERCENTS]           NUMERIC (19, 6) NULL,
    [WEIGHTS]            NUMERIC (19, 2) NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OBD_CC_ALLOC_CC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OBD_CC_ALLOC_CC_u2_id_in]
    ON [dbo].[OBD_CC_ALLOC_CC]([u2_id] ASC);

