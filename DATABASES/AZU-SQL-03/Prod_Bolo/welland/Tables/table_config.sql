CREATE TABLE [welland].[table_config] (
    [row_version]   NUMERIC (18)   NOT NULL,
    [collection_id] NUMERIC (18)   NOT NULL,
    [table_name]    VARCHAR (100)  NOT NULL,
    [export]        BIT            NOT NULL,
    [drop_table]    BIT            NOT NULL,
    [subtypes_only] BIT            NOT NULL,
    [table_params]  VARCHAR (4000) NULL,
    [time_stamp]    BIT            NOT NULL,
    [log_deletions] BIT            NOT NULL,
    CONSTRAINT [table_config_un] UNIQUE NONCLUSTERED ([collection_id] ASC, [table_name] ASC)
);

