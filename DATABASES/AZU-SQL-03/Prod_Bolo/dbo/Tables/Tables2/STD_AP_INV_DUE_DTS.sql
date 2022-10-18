CREATE TABLE [dbo].[STD_AP_INV_DUE_DTS] (
    [STD_AP_INV_DUE_DTS_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [AP_INV_INDEX]          VARCHAR (29)    NULL,
    [DUE_DATES]             DATETIME        NULL,
    [PMT_AMTS]              NUMERIC (19, 2) NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([STD_AP_INV_DUE_DTS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STD_AP_INV_DUE_DTS_u2_id_in]
    ON [dbo].[STD_AP_INV_DUE_DTS]([u2_id] ASC);

