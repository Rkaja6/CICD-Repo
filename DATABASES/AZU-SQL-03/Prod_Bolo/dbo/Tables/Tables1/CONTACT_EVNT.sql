CREATE TABLE [dbo].[CONTACT_EVNT] (
    [CONTACT_EVNT_ID]         VARCHAR (255) NOT NULL,
    [u2_id]                   VARCHAR (255) NULL,
    [EVENT_ACTIONS]           VARCHAR (6)   NULL,
    [EVENT_DATES]             DATETIME      NULL,
    [EVENT_INTERNAL_CONTACTS] VARCHAR (8)   NULL,
    [EVENT_REMARKS]           VARCHAR (25)  NULL,
    [EVENT_TYPES]             VARCHAR (7)   NULL,
    [time_stamp]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CONTACT_EVNT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CONTACT_EVNT_u2_id_in]
    ON [dbo].[CONTACT_EVNT]([u2_id] ASC);

