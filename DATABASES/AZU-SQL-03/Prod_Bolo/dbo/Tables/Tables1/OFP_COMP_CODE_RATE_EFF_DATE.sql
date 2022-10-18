CREATE TABLE [dbo].[OFP_COMP_CODE_RATE_EFF_DATE] (
    [OFP_COMP_CODE_RATE_EFF_DATE_ID] VARCHAR (255)   NOT NULL,
    [u2_id]                          VARCHAR (255)   NULL,
    [CODE_RATES]                     NUMERIC (19, 2) NULL,
    [EFF_DATES]                      DATETIME        NULL,
    [EXP_DATES]                      DATETIME        NULL,
    [time_stamp]                     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([OFP_COMP_CODE_RATE_EFF_DATE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [OFP_COMP__u2_id_1091]
    ON [dbo].[OFP_COMP_CODE_RATE_EFF_DATE]([u2_id] ASC);

