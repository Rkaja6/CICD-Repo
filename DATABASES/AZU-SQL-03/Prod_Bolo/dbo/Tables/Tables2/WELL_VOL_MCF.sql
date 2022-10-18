CREATE TABLE [dbo].[WELL_VOL_MCF] (
    [subValueId]          VARCHAR (255)   NOT NULL,
    [WELL_VOL_SALE_DT_ID] VARCHAR (255)   NULL,
    [MCFS]                NUMERIC (19, 2) NULL,
    [time_stamp]          DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [WELL_VOL__WELL_VOL__47396]
    ON [dbo].[WELL_VOL_MCF]([WELL_VOL_SALE_DT_ID] ASC);

