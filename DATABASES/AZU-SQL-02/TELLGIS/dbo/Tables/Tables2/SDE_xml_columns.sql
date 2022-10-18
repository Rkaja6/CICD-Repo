CREATE TABLE [dbo].[SDE_xml_columns] (
    [column_id]       INT           IDENTITY (1, 1) NOT NULL,
    [registration_id] INT           NOT NULL,
    [column_name]     NVARCHAR (32) NOT NULL,
    [index_id]        INT           NULL,
    [minimum_id]      INT           NULL,
    [config_keyword]  NVARCHAR (32) NULL,
    [xflags]          INT           NOT NULL,
    CONSTRAINT [xml_columns_pk] PRIMARY KEY NONCLUSTERED ([column_id] ASC),
    CONSTRAINT [xml_columns_fk1] FOREIGN KEY ([registration_id]) REFERENCES [dbo].[SDE_table_registry] ([registration_id]),
    CONSTRAINT [xml_columns_fk2] FOREIGN KEY ([index_id]) REFERENCES [dbo].[SDE_xml_indexes] ([index_id])
);


GO
CREATE UNIQUE CLUSTERED INDEX [xml_columns_uk]
    ON [dbo].[SDE_xml_columns]([registration_id] ASC, [column_name] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_xml_columns] TO PUBLIC
    AS [dbo];

