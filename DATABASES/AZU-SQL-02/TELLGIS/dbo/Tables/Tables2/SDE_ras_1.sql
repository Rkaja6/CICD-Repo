CREATE TABLE [dbo].[SDE_ras_1] (
    [raster_id]    INT           NOT NULL,
    [raster_flags] INT           NULL,
    [description]  NVARCHAR (65) NULL,
    CONSTRAINT [SDE_ras_1_pk] PRIMARY KEY CLUSTERED ([raster_id] ASC) WITH (FILLFACTOR = 75)
);

