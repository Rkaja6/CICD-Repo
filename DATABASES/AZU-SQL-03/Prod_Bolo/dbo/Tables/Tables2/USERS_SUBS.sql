CREATE TABLE [dbo].[USERS_SUBS] (
    [USERS_SUBS_ID] VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [SUBORDINATES]  VARCHAR (21)  NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([USERS_SUBS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [USERS_SUBS_u2_id_in]
    ON [dbo].[USERS_SUBS]([u2_id] ASC);

