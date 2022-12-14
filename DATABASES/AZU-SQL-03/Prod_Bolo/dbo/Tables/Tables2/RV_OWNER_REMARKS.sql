CREATE TABLE [dbo].[RV_OWNER_REMARKS] (
    [RV_OWNER_REMARKS_ID] VARCHAR (255) NOT NULL,
    [u2_id]               VARCHAR (255) NULL,
    [REMARKS]             VARCHAR (67)  NULL,
    [REMARK_DATES]        DATETIME      NULL,
    [time_stamp]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RV_OWNER_REMARKS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RV_OWNER_REMARKS_u2_id_in]
    ON [dbo].[RV_OWNER_REMARKS]([u2_id] ASC);

