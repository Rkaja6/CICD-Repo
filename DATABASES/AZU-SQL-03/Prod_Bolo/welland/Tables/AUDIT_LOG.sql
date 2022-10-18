CREATE TABLE [welland].[AUDIT_LOG] (
    [id]                NUMERIC (18)   IDENTITY (1, 1) NOT NULL,
    [server_id]         VARCHAR (64)   NULL,
    [event_code]        NUMERIC (18)   NULL,
    [event_desc]        NVARCHAR (MAX) NULL,
    [level_code]        NUMERIC (18)   NULL,
    [level_desc]        NVARCHAR (MAX) NULL,
    [job_id]            NUMERIC (18)   NULL,
    [user_id]           VARCHAR (32)   NULL,
    [u2_file]           VARCHAR (255)  NULL,
    [u2_id]             VARCHAR (255)  NULL,
    [sql_field]         VARCHAR (32)   NULL,
    [data_value]        NVARCHAR (MAX) NULL,
    [detail_message]    NVARCHAR (MAX) NULL,
    [developer_details] NVARCHAR (MAX) NULL,
    [time_stamp]        DATETIME2 (3)  NULL,
    CONSTRAINT [SYS_C0010372] PRIMARY KEY CLUSTERED ([id] ASC)
);

