CREATE TABLE [dbo].[RR_SYS_SR_NO] (
    [RR_SYS_SR_NO_ID]      VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [ST_RPTG_NOS]          VARCHAR (15)  NULL,
    [ST_RPTG_NO_EFF_DATES] DATETIME      NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RR_SYS_SR_NO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RR_SYS_SR_NO_u2_id_in]
    ON [dbo].[RR_SYS_SR_NO]([u2_id] ASC);

