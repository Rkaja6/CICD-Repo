CREATE TABLE [dbo].[STATE_LEASE_EFF_DT] (
    [STATE_LEASE_EFF_DT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                 VARCHAR (255) NULL,
    [CERTIFICATE]           VARCHAR (20)  NULL,
    [EFF_DATE]              DATETIME      NULL,
    [EXP_DATE]              DATETIME      NULL,
    [START_DATE]            DATETIME      NULL,
    [time_stamp]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([STATE_LEASE_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [STATE_LEASE_EFF_DT_u2_id_in]
    ON [dbo].[STATE_LEASE_EFF_DT]([u2_id] ASC);

