CREATE TABLE [dbo].[PRR_NM_PROPERTY_EFF_DATE] (
    [PRR_NM_PROPERTY_EFF_DATE_ID] VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [EFF_DATES]                   DATETIME      NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PRR_NM_PROPERTY_EFF_DATE_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_NM_PR_u2_id_35159]
    ON [dbo].[PRR_NM_PROPERTY_EFF_DATE]([u2_id] ASC);

