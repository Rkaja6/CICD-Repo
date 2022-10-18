CREATE TABLE [welland].[field_config] (
    [collection_id] NUMERIC (18)  NOT NULL,
    [table_name]    VARCHAR (100) NOT NULL,
    [field_name]    VARCHAR (100) NOT NULL,
    [create_index]  BIT           NOT NULL,
    CONSTRAINT [FIELD_CONFIG_UN] UNIQUE NONCLUSTERED ([collection_id] ASC, [table_name] ASC, [field_name] ASC)
);

