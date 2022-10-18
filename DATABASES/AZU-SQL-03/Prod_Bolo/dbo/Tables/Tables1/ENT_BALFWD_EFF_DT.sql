CREATE TABLE [dbo].[ENT_BALFWD_EFF_DT] (
    [ENT_BALFWD_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [EFF_DATES]            DATETIME      NULL,
    [EXP_DATES]            DATETIME      NULL,
    [OMIT_FLAGS]           VARCHAR (3)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ENT_BALFWD_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ENT_BALFWD_EFF_DT_u2_id_in]
    ON [dbo].[ENT_BALFWD_EFF_DT]([u2_id] ASC);

