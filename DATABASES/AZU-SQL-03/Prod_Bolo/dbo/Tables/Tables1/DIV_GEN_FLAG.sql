﻿CREATE TABLE [dbo].[DIV_GEN_FLAG] (
    [DIV_GEN_FLAG_ID] VARCHAR (255) NOT NULL,
    [u2_id]           VARCHAR (255) NULL,
    [GENERIC_FLAG]    VARCHAR (12)  NULL,
    [time_stamp]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([DIV_GEN_FLAG_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [DIV_GEN_FLAG_u2_id_in]
    ON [dbo].[DIV_GEN_FLAG]([u2_id] ASC);
