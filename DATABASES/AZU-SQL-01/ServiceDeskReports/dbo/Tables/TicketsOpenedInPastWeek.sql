CREATE TABLE [dbo].[TicketsOpenedInPastWeek] (
    [Request ID]          BIGINT         NOT NULL,
    [Requester]           NVARCHAR (200) NULL,
    [Technician]          NVARCHAR (200) NULL,
    [Subject]             NVARCHAR (250) NULL,
    [Request Status]      NVARCHAR (100) NULL,
    [Created Time]        DATETIME       NULL,
    [Time Elapsed - Days] INT            NULL,
    [Last Update Time]    DATETIME       NULL,
    [Due By Time]         DATETIME       NULL,
    [Group]               NVARCHAR (250) NULL,
    [SnapshotDate]        DATETIME       NULL
);

