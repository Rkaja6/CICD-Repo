CREATE TABLE [DW].[ExceptionLog] (
    [ObjectDatabase]        VARCHAR (255)  NOT NULL,
    [ObjectSchema]          VARCHAR (255)  NOT NULL,
    [ObjectName]            VARCHAR (255)  NOT NULL,
    [BusinessKey1]          VARCHAR (255)  NULL,
    [BusinessKeyFieldName1] VARCHAR (255)  NULL,
    [BusinessKey2]          VARCHAR (255)  NULL,
    [BusinessKeyFieldName2] VARCHAR (255)  NULL,
    [BusinessKey3]          VARCHAR (255)  NULL,
    [BusinessKeyFieldName3] VARCHAR (255)  NULL,
    [BusinessKey4]          VARCHAR (255)  NULL,
    [BusinessKeyFieldName4] VARCHAR (255)  NULL,
    [BusinessKey5]          VARCHAR (255)  NULL,
    [BusinessKeyFieldName5] VARCHAR (255)  NULL,
    [LoadDate]              DATETIME2 (7)  NULL,
    [ExceptionDescription]  VARCHAR (5000) NULL,
    [RunDate]               DATETIME2 (7)  CONSTRAINT [DF__Exception__RunDa__740F363E] DEFAULT (getdate()) NULL
);

