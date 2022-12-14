CREATE TABLE [dbo].[RV_OWNER_WH] (
    [RV_OWNER_WH_ID] VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [WH_FLAGS]       VARCHAR (4)   NULL,
    [WH_STATES]      VARCHAR (2)   NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RV_OWNER_WH_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_OWNER_WH_u2_id_in]
    ON [dbo].[RV_OWNER_WH]([u2_id] ASC);

