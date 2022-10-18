CREATE TABLE [dbo].[PRR_NM_MV_ASSCO] (
    [PRR_NM_MV_ASSCO_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [OIL_POD]            VARCHAR (9)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRR_NM_MV_ASSCO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_NM_MV_ASSCO_u2_id_in]
    ON [dbo].[PRR_NM_MV_ASSCO]([u2_id] ASC);

