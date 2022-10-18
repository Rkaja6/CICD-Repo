CREATE TABLE [dbo].[TankStrappingDetailTb] (
    [TankID]                INT              NOT NULL,
    [RecordDate]            DATETIME         NOT NULL,
    [TotalInches]           FLOAT (53)       NOT NULL,
    [TotalQuarterInches]    FLOAT (53)       NULL,
    [Feet]                  INT              NULL,
    [Inches]                INT              NULL,
    [QuarterInches]         FLOAT (53)       NULL,
    [Barrels]               FLOAT (53)       NULL,
    [BarrelsPerInch]        FLOAT (53)       NULL,
    [BarrelsPerQuarterInch] FLOAT (53)       NULL,
    [LastTransmission]      INT              NULL,
    [LastLoadDate]          DATETIME         NULL,
    [LastLoadTime]          CHAR (8)         NULL,
    [TransmitFlag]          INT              NULL,
    [Height]                FLOAT (53)       NULL,
    [DateTimeStamp]         DATETIME         NULL,
    [UserDateStamp]         DATETIME         NULL,
    [UserTimeStamp]         CHAR (8)         NULL,
    [UserID]                INT              NULL,
    [RowUID]                UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_TankStrappingDetailTb] PRIMARY KEY CLUSTERED ([TankID] ASC, [RecordDate] ASC, [TotalInches] ASC)
);

