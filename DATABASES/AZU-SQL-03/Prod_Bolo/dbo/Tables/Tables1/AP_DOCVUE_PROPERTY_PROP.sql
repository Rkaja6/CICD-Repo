CREATE TABLE [dbo].[AP_DOCVUE_PROPERTY_PROP] (
    [AP_DOCVUE_PROPERTY_PROP_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [ACCOUNT_NUMBER]             VARCHAR (13)  NULL,
    [AFE_NO]                     VARCHAR (16)  NULL,
    [COST_CENTER]                VARCHAR (10)  NULL,
    [COST_TYPE]                  VARCHAR (8)   NULL,
    [PROPERTY_NAME]              VARCHAR (46)  NULL,
    [PROPERTY_NO]                VARCHAR (15)  NULL,
    [TRANS_ID]                   VARCHAR (8)   NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AP_DOCVUE_PROPERTY_PROP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AP_DOCVUE_u2_id_36819]
    ON [dbo].[AP_DOCVUE_PROPERTY_PROP]([u2_id] ASC);

