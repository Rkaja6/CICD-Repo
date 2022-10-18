CREATE TABLE [dbo].[LDECK_WI] (
    [LDECK_WI_ID]       VARCHAR (255)   NOT NULL,
    [u2_id]             VARCHAR (255)   NULL,
    [TRACT]             VARCHAR (15)    NULL,
    [WI_EFF_DATES]      DATETIME        NULL,
    [WI_EFF_SESSIONS]   VARCHAR (7)     NULL,
    [WI_EXP_DATES]      DATETIME        NULL,
    [WI_EXP_SESSIONS]   VARCHAR (7)     NULL,
    [WI_INTEREST_TYPES] VARCHAR (4)     NULL,
    [WI_OWNERS]         VARCHAR (10)    NULL,
    [WORKING_INTERESTS] NUMERIC (19, 8) NULL,
    [time_stamp]        DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([LDECK_WI_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [LDECK_WI_u2_id_in]
    ON [dbo].[LDECK_WI]([u2_id] ASC);

