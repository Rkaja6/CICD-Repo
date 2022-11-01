﻿CREATE TABLE [dbo].[COD_CO_CO] (
    [COD_CO_CO_ID] VARCHAR (255) NOT NULL,
    [u2_id]        VARCHAR (255) NULL,
    [COMPANIES]    VARCHAR (8)   NULL,
    [time_stamp]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([COD_CO_CO_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [COD_CO_CO_u2_id_in]
    ON [dbo].[COD_CO_CO]([u2_id] ASC);
