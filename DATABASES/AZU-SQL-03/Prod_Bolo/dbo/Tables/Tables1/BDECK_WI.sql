CREATE TABLE [dbo].[BDECK_WI] (
    [BDECK_WI_ID]       VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [PARENT_DECK]       VARCHAR (6)     NULL,
    [WI_DISP_FLAGS]     VARCHAR (4)     NULL,
    [WI_EFF_DATES]      DATETIME        NULL,
    [WI_EFF_SESSIONS]   VARCHAR (7)     NULL,
    [WI_EXP_DATES]      DATETIME        NULL,
    [WI_EXP_SESSIONS]   VARCHAR (7)     NULL,
    [WI_OWNERS]         VARCHAR (10)    NULL,
    [WORKING_INTERESTS] NUMERIC (19, 8) NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([BDECK_WI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [BDECK_WI_u2_id_in]
    ON [dbo].[BDECK_WI]([u2_id] ASC);

