CREATE TABLE [dbo].[GC_SYS_CO] (
    [GC_SYS_CO_ID]                VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [TAKES_ENT_INSIDER_COMPANIES] VARCHAR (5)   NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GC_SYS_CO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GC_SYS_CO_u2_id_in]
    ON [dbo].[GC_SYS_CO]([u2_id] ASC);

