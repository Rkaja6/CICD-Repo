CREATE TABLE [dbo].[DIV_SESS] (
    [DIV_SESS_ID]        VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [CHANGE_DATES]       DATETIME      NULL,
    [CONTROL_FLAG]       VARCHAR (4)   NULL,
    [CPY_FLG]            VARCHAR (4)   NULL,
    [EFF_DATES]          DATETIME      NULL,
    [EXPLANATIONS]       VARCHAR (791) NULL,
    [OWN_CHANGE_IDS]     VARCHAR (6)   NULL,
    [SESSIONS]           VARCHAR (5)   NULL,
    [SESSION_APPRS]      VARCHAR (4)   NULL,
    [SESSION_APPR_DATES] DATETIME      NULL,
    [SESSION_USER_]      VARCHAR (15)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([DIV_SESS_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_SESS_u2_id_in]
    ON [dbo].[DIV_SESS]([u2_id] ASC);

