CREATE TABLE [dbo].[PRR_NM_PROPERTY_WELLS] (
    [subValueId]                  VARCHAR (255) NOT NULL,
    [PRR_NM_PROPERTY_EFF_DATE_ID] VARCHAR (255) NULL,
    [WELLS]                       VARCHAR (13)  NULL,
    [WELL_STATUS]                 VARCHAR (5)   NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [PRR_NM_PR_PRR_NM_PR_39845]
    ON [dbo].[PRR_NM_PROPERTY_WELLS]([PRR_NM_PROPERTY_EFF_DATE_ID] ASC);

