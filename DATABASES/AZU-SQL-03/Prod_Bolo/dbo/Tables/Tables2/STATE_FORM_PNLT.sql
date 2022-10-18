CREATE TABLE [dbo].[STATE_FORM_PNLT] (
    [STATE_FORM_PNLT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [PNLT_COMP]          NUMERIC (19, 4) NULL,
    [PNLT_DAYS]          VARCHAR (6)     NULL,
    [PNLT_RATE]          NUMERIC (19, 4) NULL,
    [PNLT_RULE]          VARCHAR (30)    NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([STATE_FORM_PNLT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STATE_FORM_PNLT_u2_id_in]
    ON [dbo].[STATE_FORM_PNLT]([u2_id] ASC);

