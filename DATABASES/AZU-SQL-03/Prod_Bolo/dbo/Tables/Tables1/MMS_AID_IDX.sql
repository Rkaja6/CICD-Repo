CREATE TABLE [dbo].[MMS_AID_IDX] (
    [MMS_AID_IDX_ID]      VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [INDEX_EFF_DATES]     DATETIME      NULL,
    [INDEX_EXP_DATES]     DATETIME      NULL,
    [INDEX_PRICE_METHODS] VARCHAR (8)   NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MMS_AID_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMS_AID_IDX_u2_id_in]
    ON [dbo].[MMS_AID_IDX]([u2_id] ASC);

