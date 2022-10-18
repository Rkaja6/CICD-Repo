CREATE TABLE [welland].[sftp_job_transfers] (
    [id]                NUMERIC (18)  IDENTITY (1, 1) NOT NULL,
    [job_id]            NUMERIC (18)  NOT NULL,
    [file_name]         VARCHAR (250) NOT NULL,
    [time_stamp]        DATETIME2 (3) NOT NULL,
    [server_time_stamp] DATETIME2 (3) NULL,
    CONSTRAINT [SFTP_FILE_NAME_UQ] UNIQUE NONCLUSTERED ([job_id] ASC, [file_name] ASC)
);

