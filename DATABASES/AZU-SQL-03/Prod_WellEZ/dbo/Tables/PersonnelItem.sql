CREATE TABLE [dbo].[PersonnelItem] (
    [personnelitem_id] INT            IDENTITY (1, 1) NOT NULL,
    [well_id]          BIGINT         NOT NULL,
    [report_Date]      DATETIME       NOT NULL,
    [line_number]      BIGINT         NOT NULL,
    [job_number]       BIGINT         NOT NULL,
    [UserDefined_3]    NVARCHAR (MAX) NULL,
    [UserDefined_2]    NVARCHAR (MAX) NULL,
    [UserDefined_1]    NVARCHAR (MAX) NULL,
    [Status]           NVARCHAR (MAX) NULL,
    [Service]          NVARCHAR (MAX) NULL,
    [reportTypeId]     BIGINT         NOT NULL,
    [Number]           BIGINT         NULL,
    [Hrs]              BIGINT         NULL,
    [Contractor]       NVARCHAR (MAX) NULL,
    [Company]          NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_PersonnelItem] PRIMARY KEY CLUSTERED ([personnelitem_id] ASC)
);

