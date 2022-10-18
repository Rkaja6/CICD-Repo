CREATE TABLE [dbo].[SDE_metadata] (
    [record_id]       INT            NOT NULL,
    [object_database] NVARCHAR (32)  NULL,
    [object_name]     NVARCHAR (160) NOT NULL,
    [object_owner]    NVARCHAR (32)  NOT NULL,
    [object_type]     INT            NOT NULL,
    [class_name]      NVARCHAR (32)  NULL,
    [property]        NVARCHAR (32)  NULL,
    [prop_value]      NVARCHAR (255) NULL,
    [description]     NVARCHAR (65)  NULL,
    [creation_date]   DATETIME       NOT NULL,
    CONSTRAINT [sdemetadata_pk] PRIMARY KEY CLUSTERED ([record_id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SDE_metadata] TO PUBLIC
    AS [dbo];

