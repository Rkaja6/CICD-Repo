CREATE TABLE [dbo].[CC_BUD] (
    [CC_BUD_ID]             VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [BUDGET_COMPLETE_FLAGS] VARCHAR (2)     NULL,
    [BUDGET_TOTALS]         NUMERIC (19, 2) NULL,
    [ENTERED_TOTALS]        NUMERIC (19, 2) NULL,
    [FYES]                  VARCHAR (18)    NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CC_BUD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_BUD_u2_id_in]
    ON [dbo].[CC_BUD]([u2_id] ASC);

