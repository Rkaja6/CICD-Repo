CREATE TABLE [welland].[configuration_collection] (
    [collection_id] NUMERIC (18) IDENTITY (1, 1) NOT NULL,
    [name]          VARCHAR (50) NOT NULL,
    [log_file_name] VARCHAR (30) NULL,
    CONSTRAINT [SYS_C0010309] PRIMARY KEY CLUSTERED ([collection_id] ASC),
    CONSTRAINT [SYS_C0010310] UNIQUE NONCLUSTERED ([name] ASC)
);

