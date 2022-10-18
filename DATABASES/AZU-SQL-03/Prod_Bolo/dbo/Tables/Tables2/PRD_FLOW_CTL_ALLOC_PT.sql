CREATE TABLE [dbo].[PRD_FLOW_CTL_ALLOC_PT] (
    [PRD_FLOW_CTL_ALLOC_PT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                    VARCHAR (255) NULL,
    [EFF_DATES]                DATETIME      NULL,
    [EXP_DATES]                DATETIME      NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRD_FLOW_CTL_ALLOC_PT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRD_FLOW_CTL_ALLOC_PT_u2_id_in]
    ON [dbo].[PRD_FLOW_CTL_ALLOC_PT]([u2_id] ASC);

