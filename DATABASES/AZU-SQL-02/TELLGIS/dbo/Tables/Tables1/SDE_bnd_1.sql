CREATE TABLE [dbo].[SDE_bnd_1] (
    [rasterband_id]  INT           NOT NULL,
    [sequence_nbr]   INT           NOT NULL,
    [raster_id]      INT           NOT NULL,
    [name]           NVARCHAR (65) NULL,
    [band_flags]     INT           NOT NULL,
    [band_width]     INT           NOT NULL,
    [band_height]    INT           NOT NULL,
    [band_types]     INT           NOT NULL,
    [block_width]    INT           NOT NULL,
    [block_height]   INT           NOT NULL,
    [block_origin_x] FLOAT (53)    NOT NULL,
    [block_origin_y] FLOAT (53)    NOT NULL,
    [eminx]          FLOAT (53)    NOT NULL,
    [eminy]          FLOAT (53)    NOT NULL,
    [emaxx]          FLOAT (53)    NOT NULL,
    [emaxy]          FLOAT (53)    NOT NULL,
    [cdate]          INT           NOT NULL,
    [mdate]          INT           NOT NULL,
    CONSTRAINT [SDE_bnd_1_pk] PRIMARY KEY NONCLUSTERED ([rasterband_id] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [SDE_bnd_1_uk2] UNIQUE NONCLUSTERED ([raster_id] ASC, [sequence_nbr] ASC) WITH (FILLFACTOR = 75)
);

