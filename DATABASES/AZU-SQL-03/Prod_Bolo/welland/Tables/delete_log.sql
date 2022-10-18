CREATE TABLE [welland].[delete_log] (
    [table_name]  VARCHAR (60)  NOT NULL,
    [record_id]   VARCHAR (255) NOT NULL,
    [record_date] DATE          NULL,
    CONSTRAINT [PK_DELETE_LOG_RID_TNAME] PRIMARY KEY CLUSTERED ([table_name] ASC, [record_id] ASC)
);

