CREATE TABLE [welland].[export_time] (
    [id]           NUMERIC (18)  IDENTITY (1, 1) NOT NULL,
    [thread_name]  VARCHAR (100) NULL,
    [export_type]  NUMERIC (18)  NOT NULL,
    [table_type]   NUMERIC (18)  NOT NULL,
    [table_name]   VARCHAR (100) NOT NULL,
    [time_stamp]   DATETIME2 (3) NOT NULL,
    [record_count] NUMERIC (18)  NOT NULL,
    [time_elapsed] NUMERIC (18)  NOT NULL,
    [job_id]       NUMERIC (18)  NULL,
    [batch_count]  NUMERIC (18)  NULL,
    CONSTRAINT [PK_EXPORT_TIME_ID] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ET_TIMESTAMP_IX]
    ON [welland].[export_time]([time_stamp] ASC);


GO
CREATE NONCLUSTERED INDEX [ET_TABLE_TYPE_IX]
    ON [welland].[export_time]([table_type] ASC);


GO
CREATE NONCLUSTERED INDEX [ET_TABLE_NAME_IX]
    ON [welland].[export_time]([table_name] ASC);


GO
CREATE NONCLUSTERED INDEX [et_job_id_ix]
    ON [welland].[export_time]([job_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ET_EXPORT_TYPE_IX]
    ON [welland].[export_time]([export_type] ASC);

