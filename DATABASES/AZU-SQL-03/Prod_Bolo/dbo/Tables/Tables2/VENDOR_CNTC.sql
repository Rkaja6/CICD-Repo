CREATE TABLE [dbo].[VENDOR_CNTC] (
    [VENDOR_CNTC_ID]   VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [CONTACTS]         VARCHAR (35)  NULL,
    [CONTACT_COMMENTS] VARCHAR (30)  NULL,
    [CONTACT_PHONES]   VARCHAR (12)  NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([VENDOR_CNTC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [VENDOR_CNTC_u2_id_in]
    ON [dbo].[VENDOR_CNTC]([u2_id] ASC);

