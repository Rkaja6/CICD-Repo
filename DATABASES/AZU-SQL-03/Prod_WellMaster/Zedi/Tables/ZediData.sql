CREATE TABLE [Zedi].[ZediData] (
    [location_id]       INT            NULL,
    [location]          NVARCHAR (100) NULL,
    [readingtime]       DATETIME       NOT NULL,
    [sensor]            NVARCHAR (100) NULL,
    [sensor_id]         INT            NOT NULL,
    [unit]              NVARCHAR (25)  NULL,
    [amount]            FLOAT (53)     NULL,
    [amountstring]      NVARCHAR (MAX) NULL,
    [amountdatetimeutc] DATETIME       NULL
);

