CREATE TABLE [dbo].[xmlimports] (
    [id]         INT      IDENTITY (1, 1) NOT NULL,
    [xmldata]    XML      NULL,
    [dttmimport] DATETIME NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

