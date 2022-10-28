CREATE TABLE [dbo].[ZediDataQTR] (
    [location_id] INT            NULL,
    [location]    NVARCHAR (100) NULL,
    [starttime]   DATETIME       NOT NULL,
    [endtime]     DATETIME       NULL,
    [sensor]      NVARCHAR (100) NULL,
    [sensor_id]   INT            NOT NULL,
    [unit]        NVARCHAR (25)  NULL,
    [amount]      FLOAT (53)     NULL,
    [qtrtype]     NVARCHAR (15)  NULL,
    PRIMARY KEY CLUSTERED ([starttime] ASC, [sensor_id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ndx_location_sensor_incl_all_QTR]
    ON [dbo].[ZediDataQTR]([location_id] ASC, [sensor] ASC)
    INCLUDE([location], [starttime], [endtime], [sensor_id], [unit], [amount], [qtrtype]);

