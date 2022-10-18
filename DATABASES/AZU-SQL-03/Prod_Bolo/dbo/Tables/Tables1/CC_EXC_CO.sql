﻿CREATE TABLE [dbo].[CC_EXC_CO] (
    [CC_EXC_CO_ID]  VARCHAR (255) NOT NULL,
    [u2_id]         VARCHAR (255) NULL,
    [EXC_COMPANIES] VARCHAR (5)   NULL,
    [time_stamp]    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([CC_EXC_CO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CC_EXC_CO_u2_id_in]
    ON [dbo].[CC_EXC_CO]([u2_id] ASC);

