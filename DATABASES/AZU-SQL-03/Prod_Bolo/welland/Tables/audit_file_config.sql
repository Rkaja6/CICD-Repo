CREATE TABLE [welland].[audit_file_config] (
    [audit_file_name] VARCHAR (100) NOT NULL,
    [data_file_name]  VARCHAR (100) NOT NULL,
    [time_stamp]      DATE          NOT NULL,
    [id_string]       VARCHAR (100) NULL,
    CONSTRAINT [AUDIT_FILE_CONFIG_UN] UNIQUE NONCLUSTERED ([audit_file_name] ASC, [data_file_name] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AF_DATA_IX]
    ON [welland].[audit_file_config]([data_file_name] ASC);


GO
CREATE NONCLUSTERED INDEX [AF_AUDIT_IX]
    ON [welland].[audit_file_config]([audit_file_name] ASC);

