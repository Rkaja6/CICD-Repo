CREATE TABLE [dbo].[STATE_LEASE_FORM_EXP_DT] (
    [subValueId]          VARCHAR (255) NOT NULL,
    [STATE_LEASE_FORM_ID] VARCHAR (255) NULL,
    [FORM_EXP_DTS]        DATETIME      NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STATE_LEA_STATE_LEA_10626]
    ON [dbo].[STATE_LEASE_FORM_EXP_DT]([STATE_LEASE_FORM_ID] ASC);

