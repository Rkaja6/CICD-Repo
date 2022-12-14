CREATE TABLE [dbo].[RXT_STOCKEXCHANGETICKERSYMBOLS] (
    [OBJECTID]   INT            NOT NULL,
    [COMPANY]    NVARCHAR (255) NULL,
    [COMPANY_ID] NVARCHAR (255) NULL,
    [STOCK_EX]   NVARCHAR (255) NULL,
    [STOCK]      NVARCHAR (255) NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [R82_SDE_ROWID_UK]
    ON [dbo].[RXT_STOCKEXCHANGETICKERSYMBOLS]([OBJECTID] ASC) WITH (FILLFACTOR = 75);

