CREATE TABLE [dbo].[PROD_FAC_PRD_MMS_EFF_DATE] (
    [PROD_FAC_PRD_MMS_EFF_DATE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                        VARCHAR (255) NULL,
    [MMS_EFF_DATES]                DATETIME      NULL,
    [MMS_EXP_DATES]                DATETIME      NULL,
    [time_stamp]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PROD_FAC_PRD_MMS_EFF_DATE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PROD_FAC__u2_id_62380]
    ON [dbo].[PROD_FAC_PRD_MMS_EFF_DATE]([u2_id] ASC);

