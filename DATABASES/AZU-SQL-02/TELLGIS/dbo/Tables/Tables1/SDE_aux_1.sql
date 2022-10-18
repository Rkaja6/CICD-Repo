CREATE TABLE [dbo].[SDE_aux_1] (
    [rasterband_id] INT             NOT NULL,
    [type]          INT             NOT NULL,
    [object]        VARBINARY (MAX) NOT NULL,
    CONSTRAINT [SDE_aux_1_pk] PRIMARY KEY CLUSTERED ([rasterband_id] ASC, [type] ASC) WITH (FILLFACTOR = 75)
);

