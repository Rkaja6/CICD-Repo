CREATE TABLE [dbo].[ALSI] (
    [EICCode]         VARCHAR (100) NULL,
    [status]          VARCHAR (100) NULL,
    [gasDayStartedOn] VARCHAR (100) NULL,
    [lngInventory]    VARCHAR (100) NULL,
    [sendOut]         VARCHAR (100) NULL,
    [dtmi]            VARCHAR (100) NULL,
    [dtrs]            VARCHAR (100) NULL,
    [info]            VARCHAR (100) NULL,
    [DateCreated]     DATETIME      DEFAULT (getdate()) NULL,
    [DateUpdated]     DATETIME      DEFAULT (getdate()) NULL
);

