CREATE TABLE [dbo].[POR_WELL_REWRK] (
    [POR_WELL_REWRK_ID] VARCHAR (255) NOT NULL,
    [u2_id]             VARCHAR (255) NULL,
    [REWORK_FLAGS]      VARCHAR (6)   NULL,
    [time_stamp]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([POR_WELL_REWRK_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [POR_WELL_REWRK_u2_id_in]
    ON [dbo].[POR_WELL_REWRK]([u2_id] ASC);

