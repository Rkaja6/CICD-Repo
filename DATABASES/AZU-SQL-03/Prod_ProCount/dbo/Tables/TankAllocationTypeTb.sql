CREATE TABLE [dbo].[TankAllocationTypeTb] (
    [AllocationType]            INT              NOT NULL,
    [AllocationName]            VARCHAR (50)     NULL,
    [Description]               VARCHAR (500)    NULL,
    [ActiveFlag]                INT              NULL,
    [s_TankType]                INT              NULL,
    [s_TankGaugeType]           INT              NULL,
    [s_ProductCode]             INT              NULL,
    [s_ProductType]             INT              NULL,
    [s_MeasurementPointRole]    INT              NULL,
    [s_FIFOAllocationFlag]      INT              NULL,
    [s_IgnoreBSWVolumeFlag]     INT              NULL,
    [s_TankBatteryRole]         INT              NULL,
    [s_UnitsTypeFlag]           INT              NULL,
    [s_CarryForwardFlag]        INT              NULL,
    [d_AllocationMethod]        INT              NULL,
    [d_TankDataEntryFlag]       INT              NULL,
    [d_ProductionAllocDefault]  INT              NULL,
    [d_DispositionAllocDefault] INT              NULL,
    [m_AllocationMethod]        INT              NULL,
    [m_TankDataEntryFlag]       INT              NULL,
    [m_TankDataSummaryCode]     INT              NULL,
    [m_ProductionAllocDefault]  INT              NULL,
    [m_DispositionAllocDefault] INT              NULL,
    [UserDateStamp]             DATETIME         NULL,
    [UserTimeStamp]             CHAR (8)         NULL,
    [UserID]                    INT              NULL,
    [TankCompBegInvSource]      INT              NOT NULL,
    [TankMonthlyInvSource]      INT              NOT NULL,
    [RowUID]                    UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_TankAllocationTypeTb] PRIMARY KEY CLUSTERED ([AllocationType] ASC)
);

