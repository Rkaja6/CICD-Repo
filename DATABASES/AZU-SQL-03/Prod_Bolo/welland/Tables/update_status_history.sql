CREATE TABLE [welland].[update_status_history] (
    [id]           NUMERIC (18) IDENTITY (1, 1) NOT NULL,
    [status_file]  VARCHAR (60) NULL,
    [status_date]  DATETIME     NULL,
    [status_count] BIGINT       NULL,
    CONSTRAINT [update_status_history_un] UNIQUE NONCLUSTERED ([id] ASC)
);

