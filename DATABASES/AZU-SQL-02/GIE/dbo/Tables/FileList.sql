CREATE TABLE [dbo].[FileList] (
    [FullFilePath] VARCHAR (8000) NOT NULL,
    [LastLoadDate] DATETIME       NULL,
    [RowsLoaded]   INT            NULL,
    [LoadFlag]     VARCHAR (1)    NULL
);

