CREATE TABLE [dbo].[MEAS_PT_CTRC] (
    [subValueId]       VARCHAR (255)   NOT NULL,
    [MEAS_PT_ALLOC_ID] VARCHAR (255)   NULL,
    [CTRCS]            VARCHAR (20)    NULL,
    [CTRC_PTS]         NUMERIC (19, 8) NULL,
    [time_stamp]       DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MEAS_PT_C_MEAS_PT_A_80789]
    ON [dbo].[MEAS_PT_CTRC]([MEAS_PT_ALLOC_ID] ASC);

