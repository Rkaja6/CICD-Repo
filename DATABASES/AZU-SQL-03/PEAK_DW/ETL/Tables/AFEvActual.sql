CREATE TABLE [ETL].[AFEvActual] (
    [Cost Center]               NVARCHAR (255) NULL,
    [Cost Center Number]        INT            NULL,
    [AFE Number]                NVARCHAR (255) NULL,
    [Description]               NVARCHAR (255) NULL,
    [8/8 AFE Budget]            FLOAT (53)     NULL,
    [8/8 Actual AFE Costs]      FLOAT (53)     NULL,
    [8/8 Actual (Over)/Under]   FLOAT (53)     NULL,
    [8/8 Actual % (Over)/Under] FLOAT (53)     NULL,
    [Approval]                  NVARCHAR (255) NULL,
    [Net WI %]                  FLOAT (53)     NULL,
    [Net AFE Budget]            FLOAT (53)     NULL,
    [Net Actual AFE Costs]      FLOAT (53)     NULL,
    [Net Actual (Over)/Under]   FLOAT (53)     NULL,
    [Net Actual % (Over)/Under] FLOAT (53)     NULL,
    [Operator]                  NVARCHAR (255) NULL
);

