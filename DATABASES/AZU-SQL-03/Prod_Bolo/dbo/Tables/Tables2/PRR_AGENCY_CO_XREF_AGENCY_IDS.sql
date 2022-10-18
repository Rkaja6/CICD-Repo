CREATE TABLE [dbo].[PRR_AGENCY_CO_XREF_AGENCY_IDS] (
    [PRR_AGENCY_CO_XREF_AGENCY_IDS_ID] VARCHAR (255) NOT NULL,
    [u2_id]                            VARCHAR (255) NULL,
    [AGENCIES]                         VARCHAR (8)   NULL,
    [AGENCY_CODES]                     VARCHAR (6)   NULL,
    [time_stamp]                       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRR_AGENCY_CO_XREF_AGENCY_IDS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_AGENC_u2_id_35164]
    ON [dbo].[PRR_AGENCY_CO_XREF_AGENCY_IDS]([u2_id] ASC);

