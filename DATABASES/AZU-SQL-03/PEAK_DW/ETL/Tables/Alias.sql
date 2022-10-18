CREATE TABLE [ETL].[Alias] (
    [Alias_ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Orig_String] VARCHAR (900) NULL,
    [New_String]  VARCHAR (900) NULL,
    [Type]        VARCHAR (50)  NULL,
    CONSTRAINT [PK_Alias] PRIMARY KEY CLUSTERED ([Alias_ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ndx_Type_Orig]
    ON [ETL].[Alias]([Type] ASC, [Orig_String] ASC)
    INCLUDE([New_String]);

