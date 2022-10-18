CREATE TABLE [dbo].[SDE_xml_index_tags] (
    [index_id]    INT             NOT NULL,
    [tag_id]      INT             IDENTITY (1, 1) NOT NULL,
    [tag_name]    NVARCHAR (1024) NOT NULL,
    [data_type]   INT             NOT NULL,
    [tag_alias]   INT             NULL,
    [description] NVARCHAR (64)   NULL,
    [is_excluded] INT             NOT NULL,
    CONSTRAINT [xml_indextags_pk] PRIMARY KEY CLUSTERED ([index_id] ASC, [tag_id] ASC),
    CONSTRAINT [xml_indextags_fk1] FOREIGN KEY ([index_id]) REFERENCES [dbo].[SDE_xml_indexes] ([index_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [xml_indextags_ix2]
    ON [dbo].[SDE_xml_index_tags]([tag_alias] ASC);


GO
CREATE NONCLUSTERED INDEX [xml_indextags_ix1]
    ON [dbo].[SDE_xml_index_tags]([tag_name] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_xml_index_tags] TO PUBLIC
    AS [dbo];

