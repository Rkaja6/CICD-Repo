CREATE TABLE [dbo].[DeletedAssets] (
    [deletedassets_id] INT    IDENTITY (1, 1) NOT NULL,
    [asset_id]         BIGINT NOT NULL,
    CONSTRAINT [PK_DeletedAssets] PRIMARY KEY CLUSTERED ([deletedassets_id] ASC)
);

