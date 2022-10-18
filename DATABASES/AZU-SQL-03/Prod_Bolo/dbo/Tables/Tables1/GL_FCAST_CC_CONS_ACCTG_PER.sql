﻿CREATE TABLE [dbo].[GL_FCAST_CC_CONS_ACCTG_PER] (
    [GL_FCAST_CC_CONS_ACCTG_PER_ID] VARCHAR (255) NOT NULL,
    [u2_id]                         VARCHAR (255) NULL,
    [ACCTG_PERIODS]                 DATETIME      NULL,
    [time_stamp]                    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([GL_FCAST_CC_CONS_ACCTG_PER_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GL_FCAST__u2_id_77780]
    ON [dbo].[GL_FCAST_CC_CONS_ACCTG_PER]([u2_id] ASC);

