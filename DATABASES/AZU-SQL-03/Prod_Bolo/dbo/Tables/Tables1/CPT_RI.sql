CREATE TABLE [dbo].[CPT_RI] (
    [CPT_RI_ID]          VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CPT_REIMBURSEMENTS] VARCHAR (9)   NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CPT_RI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CPT_RI_u2_id_in]
    ON [dbo].[CPT_RI]([u2_id] ASC);

