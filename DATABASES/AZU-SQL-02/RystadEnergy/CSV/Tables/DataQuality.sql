CREATE TABLE [CSV].[DataQuality] (
    [Id]                      SMALLINT     NULL,
    [Confidential Data Group] VARCHAR (34) NULL,
    [Initial Test Data Group] VARCHAR (94) NULL,
    [Production Data Group]   VARCHAR (78) NULL,
    [TellurianUpdatedDate]    DATETIME     DEFAULT (getdate()) NULL,
    [TellurianCreatedDate]    DATETIME     DEFAULT (getdate()) NULL
);

