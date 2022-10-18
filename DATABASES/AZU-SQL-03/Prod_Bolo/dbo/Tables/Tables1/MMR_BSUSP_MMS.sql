CREATE TABLE [dbo].[MMR_BSUSP_MMS] (
    [MMR_BSUSP_MMS_ID] VARCHAR (255)   NOT NULL,
    [u2_id]            VARCHAR (255)   NULL,
    [MMS_TYPE]         VARCHAR (3)     NULL,
    [TOT_AMT]          NUMERIC (19, 2) NULL,
    [time_stamp]       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([MMR_BSUSP_MMS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMR_BSUSP_MMS_u2_id_in]
    ON [dbo].[MMR_BSUSP_MMS]([u2_id] ASC);

