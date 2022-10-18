CREATE TABLE [ETL].[ActualVBudget_VolumesByWell] (
    [Type]              NVARCHAR (255) NULL,
    [GL Amount]         FLOAT (53)     NULL,
    [GL Qty1]           FLOAT (53)     NULL,
    [Main Acct]         FLOAT (53)     NULL,
    [Sub Acct]          FLOAT (53)     NULL,
    [CC Number]         FLOAT (53)     NULL,
    [CC Name]           NVARCHAR (255) NULL,
    [Voucher Source]    NVARCHAR (255) NULL,
    [CC Operator]       NVARCHAR (255) NULL,
    [Acctg Period]      DATETIME       NULL,
    [Occur Date]        DATETIME       NULL,
    [Prodview Volumes]  DATETIME       NULL,
    [Gathering System]  DATETIME       NULL,
    [Operated or Nonop] NVARCHAR (255) NULL,
    [F15]               DATETIME       NULL,
    [F16]               DATETIME       NULL,
    [F17]               DATETIME       NULL,
    [F18]               DATETIME       NULL
);

