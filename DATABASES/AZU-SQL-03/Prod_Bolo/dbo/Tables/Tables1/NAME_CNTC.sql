CREATE TABLE [dbo].[NAME_CNTC] (
    [NAME_CNTC_ID]   VARCHAR (255) NOT NULL,
    [u2_id]          VARCHAR (255) NULL,
    [CELL_PHONES]    VARCHAR (25)  NULL,
    [CNTC_COMMENTS]  VARCHAR (118) NULL,
    [CONTACT_METHOD] VARCHAR (6)   NULL,
    [CONTACT_NAME]   VARCHAR (132) NULL,
    [CONTACT_ROLE]   VARCHAR (22)  NULL,
    [EMAIL_ADDR]     VARCHAR (50)  NULL,
    [FAXES]          VARCHAR (28)  NULL,
    [FAX_COMMENT]    VARCHAR (30)  NULL,
    [PHONES]         VARCHAR (36)  NULL,
    [PHONE_COMMENT]  VARCHAR (30)  NULL,
    [SEND_TO]        VARCHAR (7)   NULL,
    [time_stamp]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([NAME_CNTC_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NAME_CNTC_u2_id_in]
    ON [dbo].[NAME_CNTC]([u2_id] ASC);

