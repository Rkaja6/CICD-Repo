CREATE TABLE [dbo].[AT_CTL_CO] (
    [AT_CTL_CO_ID]         VARCHAR (255) NOT NULL,
    [u2_id]                VARCHAR (255) NULL,
    [AT_ENABLED_COMPANIES] VARCHAR (5)   NULL,
    [time_stamp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([AT_CTL_CO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_CTL_CO_u2_id_in]
    ON [dbo].[AT_CTL_CO]([u2_id] ASC);

