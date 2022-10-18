CREATE TABLE [dbo].[SDE_xml_indexes] (
    [index_id]    INT           IDENTITY (1, 1) NOT NULL,
    [index_name]  NVARCHAR (32) NOT NULL,
    [owner]       NVARCHAR (32) NOT NULL,
    [index_type]  INT           NOT NULL,
    [description] NVARCHAR (64) NULL,
    CONSTRAINT [xml_indexes_pk] PRIMARY KEY CLUSTERED ([index_id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [xml_indexes_uk]
    ON [dbo].[SDE_xml_indexes]([owner] ASC, [index_name] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_xml_indexes] TO PUBLIC
    AS [dbo];

