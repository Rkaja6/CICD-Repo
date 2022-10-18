CREATE TABLE [dbo].[WFETransportVessel] (
    [wfetransportvessel_id] INT             IDENTITY (1, 1) NOT NULL,
    [well_id]               BIGINT          NULL,
    [report_Date]           DATETIME        NOT NULL,
    [line_number]           BIGINT          NOT NULL,
    [job_number]            BIGINT          NOT NULL,
    [VesselFuel_Time]       DATETIME        NULL,
    [VesselFuel_On]         DECIMAL (19, 9) NULL,
    [VesselFuel_Off]        DECIMAL (19, 9) NULL,
    [Type]                  NVARCHAR (MAX)  NULL,
    [reportTypeId]          BIGINT          NOT NULL,
    [Remark]                NVARCHAR (MAX)  NULL,
    [Name]                  NVARCHAR (MAX)  NULL,
    [Location]              NVARCHAR (MAX)  NULL,
    [Crew]                  BIGINT          NULL,
    [Captain]               NVARCHAR (MAX)  NULL,
    [Activity]              NVARCHAR (MAX)  NULL,
    [RowID]                 BIGINT          NOT NULL,
    CONSTRAINT [PK_WFETransportVessel] PRIMARY KEY CLUSTERED ([wfetransportvessel_id] ASC)
);

