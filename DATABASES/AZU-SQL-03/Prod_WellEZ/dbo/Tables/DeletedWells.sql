CREATE TABLE [dbo].[DeletedWells] (
    [deletedwells_id] INT    IDENTITY (1, 1) NOT NULL,
    [well_id]         BIGINT NOT NULL,
    CONSTRAINT [PK_DeletedWells] PRIMARY KEY CLUSTERED ([deletedwells_id] ASC)
);

