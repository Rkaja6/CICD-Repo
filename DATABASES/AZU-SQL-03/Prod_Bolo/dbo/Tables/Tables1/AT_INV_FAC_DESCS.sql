CREATE TABLE [dbo].[AT_INV_FAC_DESCS] (
    [AT_INV_FAC_DESCS_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [DESCRIPTION]         VARCHAR (10)  NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_INV_FAC_DESCS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_INV_FAC_DESCS_u2_id_in]
    ON [dbo].[AT_INV_FAC_DESCS]([u2_id] ASC);

