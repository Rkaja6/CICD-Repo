CREATE TABLE [dbo].[OIL_STMT_RT_IDX] (
    [OIL_STMT_RT_IDX_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [RUN_TICKET_INDEX]   VARCHAR (11)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([OIL_STMT_RT_IDX_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OIL_STMT_RT_IDX_u2_id_in]
    ON [dbo].[OIL_STMT_RT_IDX]([u2_id] ASC);

