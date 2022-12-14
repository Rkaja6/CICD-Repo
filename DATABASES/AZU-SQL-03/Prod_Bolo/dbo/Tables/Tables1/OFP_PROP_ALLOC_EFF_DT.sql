CREATE TABLE [dbo].[OFP_PROP_ALLOC_EFF_DT] (
    [OFP_PROP_ALLOC_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [EFF_DATES]                DATETIME      NULL,
    [EXP_DATES]                DATETIME      NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OFP_PROP_ALLOC_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OFP_PROP_ALLOC_EFF_DT_u2_id_in]
    ON [dbo].[OFP_PROP_ALLOC_EFF_DT]([u2_id] ASC);

