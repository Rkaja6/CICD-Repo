CREATE TABLE [dbo].[AT_DDA_RATE_MSGS] (
    [subValueId]               VARCHAR (255) NOT NULL,
    [AT_DDA_RATE_CALC_DATE_ID] VARCHAR (255) NULL,
    [MSGS]                     VARCHAR (15)  NULL,
    [time_stamp]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [AT_DDA_RA_AT_DDA_RA_85648]
    ON [dbo].[AT_DDA_RATE_MSGS]([AT_DDA_RATE_CALC_DATE_ID] ASC);

