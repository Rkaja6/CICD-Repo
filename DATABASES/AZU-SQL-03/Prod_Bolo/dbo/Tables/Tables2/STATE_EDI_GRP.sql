CREATE TABLE [dbo].[STATE_EDI_GRP] (
    [STATE_EDI_GRP_ID] VARCHAR (255) NOT NULL,
    [u2_id]            VARCHAR (255) NULL,
    [GRP_ASSOC]        VARCHAR (3)   NULL,
    [GRP_ID]           VARCHAR (10)  NULL,
    [PRD_ASSOC]        VARCHAR (3)   NULL,
    [time_stamp]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([STATE_EDI_GRP_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STATE_EDI_GRP_u2_id_in]
    ON [dbo].[STATE_EDI_GRP]([u2_id] ASC);

