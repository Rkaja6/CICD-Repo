CREATE TABLE [dbo].[CURR_XCH_EFF_DT] (
    [CURR_XCH_EFF_DT_ID] VARCHAR (255)   NOT NULL,
    [u2_id]              VARCHAR (255)   NULL,
    [COMMENTS]           VARCHAR (25)    NULL,
    [EFF_DATES]          DATETIME        NULL,
    [RATES]              NUMERIC (19, 4) NULL,
    [time_stamp]         DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CURR_XCH_EFF_DT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CURR_XCH_EFF_DT_u2_id_in]
    ON [dbo].[CURR_XCH_EFF_DT]([u2_id] ASC);

