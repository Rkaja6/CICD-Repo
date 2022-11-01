﻿CREATE TABLE [dbo].[FDEFS_FOREIGN_KEY] (
    [subValueId]         VARCHAR (255) NOT NULL,
    [FDEFS_DATA_DICT_ID] VARCHAR (255) NULL,
    [FOREIGN_KEY_TABLE]  VARCHAR (25)  NULL,
    [time_stamp]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([subValueId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FDEFS_FOR_FDEFS_DAT_55644]
    ON [dbo].[FDEFS_FOREIGN_KEY]([FDEFS_DATA_DICT_ID] ASC);
