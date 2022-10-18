CREATE TABLE [welland].[rollbk] (
    [table_name]  VARCHAR (60)   NULL,
    [record_id]   VARCHAR (60)   NULL,
    [update_type] VARCHAR (3)    NULL,
    [record_date] DATE           NULL,
    [path]        NVARCHAR (MAX) NULL
);


GO
CREATE NONCLUSTERED INDEX [ROLLBK_DATE_IX]
    ON [welland].[rollbk]([record_date] ASC);

