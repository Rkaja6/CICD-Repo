CREATE TABLE [dbo].[MMS_AID_EFF_DT] (
    [MMS_AID_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [OMIT_2014]         VARCHAR (3)   NULL,
    [RIK_FLAG]          VARCHAR (3)   NULL,
    [SA_CODES]          VARCHAR (5)   NULL,
    [SA_EFF_DATES]      DATETIME      NULL,
    [SA_RIKCDS]         VARCHAR (6)   NULL,
    [TRANS_RIKCD]       VARCHAR (3)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([MMS_AID_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MMS_AID_EFF_DT_u2_id_in]
    ON [dbo].[MMS_AID_EFF_DT]([u2_id] ASC);

