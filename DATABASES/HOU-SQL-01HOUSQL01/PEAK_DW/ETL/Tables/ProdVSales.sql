CREATE TABLE [ETL].[ProdVSales] (
    [Date]                 DATETIME       NULL,
    [API]                  NVARCHAR (255) NULL,
    [Cost Center]          NVARCHAR (255) NULL,
    [Op or Nonop]          NVARCHAR (255) NULL,
    [Bolo Gas Sales]       FLOAT (53)     NULL,
    [Alloc Gas Production] FLOAT (53)     NULL,
    [ProdView Gas Sales]   FLOAT (53)     NULL,
    [Fuel Gas]             FLOAT (53)     NULL,
    [Cost Center Number]   NVARCHAR (255) NULL,
    [County]               NVARCHAR (255) NULL,
    [District]             NVARCHAR (255) NULL,
    [Area]                 NVARCHAR (255) NULL,
    [Field]                NVARCHAR (255) NULL,
    [Operator]             NVARCHAR (255) NULL,
    [WorkingInterest]      FLOAT (53)     NULL,
    [Gas_NRI]              FLOAT (53)     NULL,
    [Producing_Method]     NVARCHAR (255) NULL,
    [ARIES_Propnum]        NVARCHAR (255) NULL,
    [Downtime_Type]        NVARCHAR (255) NULL,
    [Downtime_Code]        NVARCHAR (255) NULL,
    [Downtime_Duration]    FLOAT (53)     NULL
);

