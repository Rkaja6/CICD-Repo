﻿CREATE TABLE [dbo].[RIO_MONTHLY_ERR] (
    [RIO_MONTHLY_ERR_ID] VARCHAR (255) NOT NULL,
    [u2_id]              VARCHAR (255) NULL,
    [ERRORS]             VARCHAR (45)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([RIO_MONTHLY_ERR_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RIO_MONTHLY_ERR_u2_id_in]
    ON [dbo].[RIO_MONTHLY_ERR]([u2_id] ASC);

