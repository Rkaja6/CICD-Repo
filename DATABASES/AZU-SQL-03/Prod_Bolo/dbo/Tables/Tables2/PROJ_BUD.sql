CREATE TABLE [dbo].[PROJ_BUD] (
    [PROJ_BUD_ID]         VARCHAR (255)   NOT NULL,
    [u2_id]               VARCHAR (255)   NULL,
    [ACCT_ENTERED_TOTALS] NUMERIC (19, 2) NULL,
    [BDECK_INDEX]         VARCHAR (8)     NULL,
    [BUDGET_INDEX]        VARCHAR (49)    NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([PROJ_BUD_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROJ_BUD_u2_id_in]
    ON [dbo].[PROJ_BUD]([u2_id] ASC);

