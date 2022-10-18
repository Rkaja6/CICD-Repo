CREATE TABLE [stage].[LoadedFileInfo] (
    [RowNumber]       INT            IDENTITY (1, 1) NOT NULL,
    [FileName]        NVARCHAR (280) NULL,
    [SheetName]       NVARCHAR (280) NULL,
    [LoadedDateTime]  DATETIME       NULL,
    [HeaderRowNumber] INT            NULL,
    [EffDate]         DATE           NULL
);

