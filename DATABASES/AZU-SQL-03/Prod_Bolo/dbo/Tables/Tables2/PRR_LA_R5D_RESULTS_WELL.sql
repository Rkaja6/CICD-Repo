CREATE TABLE [dbo].[PRR_LA_R5D_RESULTS_WELL] (
    [PRR_LA_R5D_RESULTS_WELL_ID] VARCHAR (255) NOT NULL,
    [u2_id]                      VARCHAR (255) NULL,
    [WELL]                       VARCHAR (10)  NULL,
    [time_stamp]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRR_LA_R5D_RESULTS_WELL_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_LA_R5_u2_id_41261]
    ON [dbo].[PRR_LA_R5D_RESULTS_WELL]([u2_id] ASC);

