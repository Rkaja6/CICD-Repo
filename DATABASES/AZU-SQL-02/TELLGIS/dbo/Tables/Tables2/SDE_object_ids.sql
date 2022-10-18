CREATE TABLE [dbo].[SDE_object_ids] (
    [id_type]     INT          NOT NULL,
    [base_id]     BIGINT       NOT NULL,
    [object_type] VARCHAR (30) NOT NULL,
    CONSTRAINT [object_ids_pk] PRIMARY KEY CLUSTERED ([id_type] ASC)
);

