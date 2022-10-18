CREATE TABLE [dbo].[STATE_PRD_RV] (
    [STATE_PRD_RV_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [REV_PRD]         VARCHAR (3)   NULL,
    [REV_UOM]         VARCHAR (3)   NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([STATE_PRD_RV_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STATE_PRD_RV_u2_id_in]
    ON [dbo].[STATE_PRD_RV]([u2_id] ASC);

