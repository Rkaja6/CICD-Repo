CREATE TABLE [dbo].[DeletedLocations] (
    [deletedlocations_id] INT IDENTITY (1, 1) NOT NULL,
    [location_id]         INT NOT NULL,
    CONSTRAINT [PK_DeletedLocations] PRIMARY KEY CLUSTERED ([deletedlocations_id] ASC)
);

