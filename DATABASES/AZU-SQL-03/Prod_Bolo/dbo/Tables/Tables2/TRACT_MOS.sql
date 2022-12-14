CREATE TABLE [dbo].[TRACT_MOS] (
    [subValueId]       VARCHAR (255) NOT NULL,
    [TRACT_SPC_OBL_ID] VARCHAR (255) NULL,
    [SPC_OBL_MOS]      VARCHAR (3)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [TRACT_MOS_TRACT_SPC_OBL_ID_in]
    ON [dbo].[TRACT_MOS]([TRACT_SPC_OBL_ID] ASC);

