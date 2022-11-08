CREATE TABLE [dbo].[ZediData] (
    [location_id]       INT            NULL,
    [location]          NVARCHAR (100) NULL,
    [readingtime]       DATETIME       NOT NULL,
    [sensor]            NVARCHAR (100) NULL,
    [sensor_id]         INT            NOT NULL,
    [unit]              NVARCHAR (25)  NULL,
    [amount]            FLOAT (53)     NULL,
    [amountstring]      NVARCHAR (MAX) NULL,
    [amountdatetimeutc] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([readingtime] ASC, [sensor_id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ndx_location_sensor_incl_all]
    ON [dbo].[ZediData]([location_id] ASC, [sensor] ASC)
    INCLUDE([location], [readingtime], [sensor_id], [unit], [amount], [amountstring], [amountdatetimeutc]);

