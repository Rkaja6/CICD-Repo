CREATE TABLE [welland].[job] (
    [job_id]                 NUMERIC (18)   IDENTITY (1, 1) NOT NULL,
    [name]                   VARCHAR (50)   NOT NULL,
    [schedule_class]         VARCHAR (255)  NOT NULL,
    [schedule_param]         VARCHAR (25)   NULL,
    [action_class]           VARCHAR (255)  NOT NULL,
    [action_state_code]      NUMERIC (18)   NOT NULL,
    [action_state_param]     VARCHAR (255)  NULL,
    [notify_on_success]      NUMERIC (1)    NULL,
    [notify_success_address] VARCHAR (4000) NULL,
    [notify_on_failure]      NUMERIC (1)    NULL,
    [notify_failure_address] VARCHAR (4000) NULL,
    [collection_id]          NUMERIC (18)   NULL,
    [job_param_1]            VARCHAR (100)  NULL,
    [job_param_2]            VARCHAR (100)  NULL,
    [job_param_3]            VARCHAR (100)  NULL,
    [job_param_text_1]       NVARCHAR (MAX) NULL,
    [job_param_text_2]       NVARCHAR (MAX) NULL,
    [job_param_text_3]       NVARCHAR (MAX) NULL,
    [last_finish_date]       VARCHAR (100)  NULL,
    CONSTRAINT [SYS_C0010332] PRIMARY KEY CLUSTERED ([job_id] ASC),
    CONSTRAINT [SYS_C0010333] UNIQUE NONCLUSTERED ([name] ASC)
);

