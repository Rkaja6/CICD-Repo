CREATE TABLE [dbo].[CTRC_CC_PART_PARTICIPANT] (
    [CTRC_CC_PART_PARTICIPANT_ID] VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [INT_TYPES]                   VARCHAR (8)   NULL,
    [PARTICIPANTS]                VARCHAR (12)  NULL,
    [PART_EFF_DATES]              DATETIME      NULL,
    [PART_EXP_DATES]              DATETIME      NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CTRC_CC_PART_PARTICIPANT_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CTRC_CC_P_u2_id_3573]
    ON [dbo].[CTRC_CC_PART_PARTICIPANT]([u2_id] ASC);

