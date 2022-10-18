CREATE TABLE [dbo].[SDE_blk_3] (
    [rasterband_id] INT             NOT NULL,
    [rrd_factor]    INT             NOT NULL,
    [row_nbr]       INT             NOT NULL,
    [col_nbr]       INT             NOT NULL,
    [block_data]    VARBINARY (MAX) NOT NULL,
    CONSTRAINT [SDE_blk_3_pk] PRIMARY KEY CLUSTERED ([rasterband_id] ASC, [rrd_factor] ASC, [row_nbr] ASC, [col_nbr] ASC) WITH (FILLFACTOR = 75)
);

