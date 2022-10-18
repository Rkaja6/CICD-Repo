CREATE TABLE [ARIES].[Monthly_Prod_STG] (
    [PROPNUM]         VARCHAR (12)    NULL,
    [State]           VARCHAR (50)    NULL,
    [Month_StartDate] DATE            NULL,
    [Oil]             DECIMAL (14, 4) NULL,
    [Gas]             DECIMAL (14, 4) NULL,
    [Water]           DECIMAL (14, 4) NULL,
    [Oil_Source]      VARCHAR (10)    NULL,
    [Gas_Source]      VARCHAR (10)    NULL,
    [Water_Source]    VARCHAR (10)    NULL,
    [IHS_OIL]         DECIMAL (14, 4) NULL,
    [IHS_GAS]         DECIMAL (14, 4) NULL,
    [IHS_WATER]       DECIMAL (14, 4) NULL,
    [IHS_NumOfWells]  INT             NULL,
    [DI_OIL]          DECIMAL (14, 4) NULL,
    [DI_GAS]          DECIMAL (14, 4) NULL,
    [DI_WATER]        DECIMAL (14, 4) NULL,
    [DI_NumOfWells]   INT             NULL
);

