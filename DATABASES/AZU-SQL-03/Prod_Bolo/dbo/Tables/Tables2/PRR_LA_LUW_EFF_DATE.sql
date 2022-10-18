CREATE TABLE [dbo].[PRR_LA_LUW_EFF_DATE] (
    [PRR_LA_LUW_EFF_DATE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                  VARCHAR (255) NULL,
    [EFF_DATES]              DATETIME      NULL,
    [FACILITY]               VARCHAR (8)   NULL,
    [time_stamp]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRR_LA_LUW_EFF_DATE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_LA_LUW_EFF_DATE_u2_id_in]
    ON [dbo].[PRR_LA_LUW_EFF_DATE]([u2_id] ASC);

