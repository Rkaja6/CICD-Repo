CREATE TABLE [dbo].[WELL_INFO_MMS_AID] (
    [WELL_INFO_MMS_AID_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [AGREEMENT_NOS]        VARCHAR (11)  NULL,
    [AID_NOS]              VARCHAR (11)  NULL,
    [IND_TYPES]            VARCHAR (3)   NULL,
    [TYPES]                VARCHAR (3)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([WELL_INFO_MMS_AID_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_INFO_MMS_AID_u2_id_in]
    ON [dbo].[WELL_INFO_MMS_AID]([u2_id] ASC);

