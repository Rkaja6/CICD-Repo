CREATE TABLE [ETL].[Alias_Source] (
    [Alias_Source_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Database_Name]   VARCHAR (100) NULL,
    [Table_Name]      VARCHAR (100) NULL,
    [Column_Name]     VARCHAR (100) NULL,
    [Alias_Type]      VARCHAR (50)  NULL,
    [Last_Load_Date]  DATETIME      NULL,
    CONSTRAINT [PK_Alias_Source] PRIMARY KEY CLUSTERED ([Alias_Source_ID] ASC)
);

