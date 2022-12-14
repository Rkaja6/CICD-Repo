CREATE TABLE [dbo].[ANALYST_SELECT_PURCHASER] (
    [ANALYST_SELECT_PURCHASER_ID] VARCHAR (255) NOT NULL,
    [u2_id]                       VARCHAR (255) NULL,
    [PURCHASER]                   VARCHAR (9)   NULL,
    [time_stamp]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ANALYST_SELECT_PURCHASER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ANALYST_S_u2_id_65982]
    ON [dbo].[ANALYST_SELECT_PURCHASER]([u2_id] ASC);

