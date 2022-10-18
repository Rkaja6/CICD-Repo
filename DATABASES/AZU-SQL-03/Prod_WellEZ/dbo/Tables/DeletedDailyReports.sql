CREATE TABLE [dbo].[DeletedDailyReports] (
    [deleteddailyreports_id] INT      IDENTITY (1, 1) NOT NULL,
    [job_number]             BIGINT   NOT NULL,
    [report_Date]            DATETIME NOT NULL,
    CONSTRAINT [PK_DeletedDailyReports] PRIMARY KEY CLUSTERED ([deleteddailyreports_id] ASC)
);

