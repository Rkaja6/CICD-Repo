CREATE TABLE [dbo].[OBD_CC_ALLOC_HDR_EFF_DT] (
    [OBD_CC_ALLOC_HDR_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [EFF_DATES]                  VARCHAR (9)   NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OBD_CC_ALLOC_HDR_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OBD_CC_AL_u2_id_98956]
    ON [dbo].[OBD_CC_ALLOC_HDR_EFF_DT]([u2_id] ASC);

