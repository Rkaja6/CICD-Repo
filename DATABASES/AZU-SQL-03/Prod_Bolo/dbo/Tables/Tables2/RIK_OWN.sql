CREATE TABLE [dbo].[RIK_OWN] (
    [RIK_OWN_ID]     VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [INTEREST_TYPES] VARCHAR (4)   NULL,
    [OWNERS]         VARCHAR (10)  NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RIK_OWN_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RIK_OWN_u2_id_in]
    ON [dbo].[RIK_OWN]([u2_id] ASC);

