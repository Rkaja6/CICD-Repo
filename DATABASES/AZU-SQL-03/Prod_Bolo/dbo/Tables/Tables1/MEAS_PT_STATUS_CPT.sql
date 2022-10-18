CREATE TABLE [dbo].[MEAS_PT_STATUS_CPT] (
    [MEAS_PT_STATUS_CPT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                 VARCHAR (255)   NULL,
    [CPTS]                  VARCHAR (4)     NULL,
    [CPT_PRDS]              VARCHAR (3)     NULL,
    [CPT_VALUES]            NUMERIC (19, 2) NULL,
    [time_stamp]            DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([MEAS_PT_STATUS_CPT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [MEAS_PT_STATUS_CPT_u2_id_in]
    ON [dbo].[MEAS_PT_STATUS_CPT]([u2_id] ASC);

